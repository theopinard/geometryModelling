clear all
close all
clc

n = 100;
r_rbf = 2;
num_point = 5000;
coeff_poly = 1;


t = linspace(0,2*pi*(1-1/n), n);

% %circle
% P = [cos(t'), sin(t')];
% Normal = [cos(t'), sin(t')]; 

%face
P1 = [cos(t'), sin(t')];
Normal1 = [cos(t'), sin(t')];

P2 = 0.1 * P1 + repmat([0.25 0.25],n,1);
Normal2 = -Normal1;

P3 = 0.1 * P1 + repmat([-0.25 0.25],n,1);
Normal3 = -Normal1;

P4 = 0.2 * P1 + repmat([0 -0.25],n,1);
Normal4 = -Normal1;

P = [P1;P2;P3;P4];
Normal = -[Normal1;Normal2;Normal3;Normal4];


rectangle = [-2 -2;-2 2;2 2;2 -2];
tic
[ rectangle,a ] = divide( P,rectangle, num_point);
toc



%Solve linear system
tic
alpha = cell(1,size(a,2));
centers = cell(1,size(a,2));
gamma = cell(1,size(a,2));
center = zeros(size(a,2),2);
r = zeros(size(a,2),1);
for i = 1:size(a,2)
    P_in = P(a(:,i)==1,:);
    N_in = Normal(a(:,i)==1,:);
    rectangle_in = squeeze(rectangle(:,:,i));
    [alpha{i},beta{i},gamma{i}] = rbf_solver(P_in,N_in,r_rbf,coeff_poly);
    center(i,:) = mean(P_in);
    r(i) = max(max(pdist2(P_in,P_in))) / 2;
end
toc


% Eval RBF implicits
n = 100;
t = linspace(-2,2,n);
[X,Y] = meshgrid(t);
points_in = [X(:) Y(:)];
F = zeros(size(points_in,1),1);

tic
s= zeros(n^2,1);

for j = 1:size(a,2);
    P_in = P(a(:,j)==1,:);
    N_in = Normal(a(:,j)==1,:);
    F = F + phi_l(points_in-repmat(center(j,:),n^2,1),r(j)) .* rbf_evaluate(points_in,P_in,alpha{j},beta{j},gamma{j},r_rbf);
    s = s + phi_l(points_in-repmat(center(j,:),n^2,1),r(j));
end
    
F = F ./ s;
toc    

F = reshape(F,[n,n]);




figure
hold on 
plot(P(:,1), P(:,2), '*','LineWidth',2)
quiver(P(:,1), P(:,2),Normal(:,1),Normal(:,2),'k','LineWidth',2);


for ii = 1:size(a,2)
    plot(rectangle([1 2 3 4 1],1,ii), rectangle([1 2 3 4 1],2,ii),'r-')
end
print(gcf,'-djpeg ', ['figure\points_n_' num2str(size(P,1)) '_Points_rect_' num2str(num_point) '_Rrbf_' num2str(r_rbf) '_poly_' num2str(coeff_poly) '.jpg'])



figure;
contourf(X,Y,F, 'LineStyle','None')

hold on
contour(X,Y,F,[0 0],'k', 'LineWidth',3)

print(gcf,'-djpeg ', ['figure\implicit_function_n_' num2str(size(P,1)) '_Points_rect_' num2str(num_point) '_Rrbf_' num2str(r_rbf) '_poly_' num2str(coeff_poly) '.jpg'])

