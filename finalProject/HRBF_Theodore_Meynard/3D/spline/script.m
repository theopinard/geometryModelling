clear all
close all
clc

r_rbf =2;
num_point = 1000;
coeff_poly = 0;
object = 3; 
%object = 1 => sphere
%object = 2 => torus 
%object = 3 => bunny

if object ==1;
    %sphere
    P = [1 0 0; 0 0 1; 0 1 0;...
        -1 0 0; 0 0 -1; 0 -1 0];


    Normal =    [1 0 0; 0 0 1; 0 1 0;...
                -1 0 0; 0 0 -1; 0 -1 0];
elseif object == 2;
    %torus % best r = 0.6 
    n1 = 4;
    n2 = 8;
    theta = linspace(0,2*pi*(1-1/n1), n1);
    psi = linspace(0,2*pi*(1-1/n2), n2);
    [theta , psi] = meshgrid(theta,psi);
    theta = theta(:); psi = psi(:);
    a= 0.1; b = 0.5;
    P1 = [(a*cos(theta)+b).*cos(psi) (a*cos(theta)+b).*sin(psi) a*sin(theta)];
    Normal1 = [(a*cos(theta)).*cos(psi) (a*cos(theta)).*sin(psi) a*sin(theta)];

    P2 = [b + (a*cos(theta)+b).*cos(psi) a*sin(theta) (a*cos(theta)+b).*sin(psi)];
    Normal2 = [(a*cos(theta)).*cos(psi) a*sin(theta) (a*cos(theta)).*sin(psi)];

    P = [P1;P2];
    Normal = [Normal1;Normal2];
elseif object ==3;
    %bunny 
    load('../bunny.mat')
    Normal = [N(:,1),-N(:,3),N(:,2)];
    P = [P(:,1),-P(:,3),P(:,2)];
end

box = [-2 -2 -2;-2 2 -2;2 2 -2;2 -2 -2;-2 -2 2;-2 2 2;2 2 2;2 -2 2];

tic
[ box,a ] = divide( P,box, num_point);
toc

%%

%Solve linear system

N = size(P,1);
n = size(P,2);
tic
alpha = cell(1,size(a,2));
beta = cell(1,size(a,2));
centers = cell(1,size(a,2));
gamma = cell(1,size(a,2));
center = zeros(size(a,2),n);
r = zeros(size(a,2),1);
for i = 1:size(a,2)
    P_in = P(a(:,i)==1,:);
    N_in = Normal(a(:,i)==1,:);
    box_in = squeeze(box(:,:,i));
    [alpha{i},beta{i},gamma{i}] = rbf_solver(P_in,N_in,r_rbf,coeff_poly);
    center(i,:) = mean(P_in);
    r(i) = max(max(pdist2(P_in,P_in))) / 2;
end
toc

%eval rbf

M = 20;


t = linspace(-1.2*max(max(P)),1.2*max(max(P)),M);
[X,Y,Z] = meshgrid(t);
points_in = [X(:) Y(:) Z(:)];

F = zeros(size(points_in,1),1);

tic
s= zeros(size(F,1),1);

for j = 1:size(a,2);
    P_in = P(a(:,j)==1,:);
    N_in = Normal(a(:,j)==1,:);
    F = F + phi_l(points_in-repmat(center(j,:),size(F,1),1),r(j)) .* rbf_evaluate(points_in,P_in,alpha{j},beta{j},gamma{j},r_rbf);
    %F = F + phi(points_in-repmat(center(j,:),n^2,1),r(j)) .* rbf_evaluate(points_in,centers{j},alpha{j});
    s = s + phi_l(points_in-repmat(center(j,:),size(F,1),1),r(j));
end
    
F = F ./ s;
toc    

F = reshape(F,[M,M,M]);

figure
hold on
plot3(P(:,1),P(:,2),P(:,3), '*')
% for k=1:size(P,1);
%     text(P(k,1), P(k,2),['  ' num2str(k)]);
% end

xlabel('x')
ylabel('y')
zlabel('z')

for ii = 1:size(a,2)
    plot3(P(a(:,ii) == 1,1),P(a(:,ii) == 1,2),P(a(:,ii) == 1,3), 'ro')
    plot3(box([1 2 3 4 1 5 6 7 8 5 8 4 3 7 6 2],1,ii), box([1 2 3 4 1 5 6 7 8 5 8 4 3 7 6 2],2,ii),box([1 2 3 4 1 5 6 7 8 5 8 4 3 7 6 2],3,ii))
end
view(3)
daspect([1 1 1])
print(gcf,'-djpeg ', ['figure\points_n_' num2str(size(P,1)) '_Points_rect_' num2str(num_point) '_Rrbf_' num2str(r_rbf) '_poly_' num2str(coeff_poly) '_object_' num2str(object) '.jpg'])


figure
hold on
%plot3(P(:,1),P(:,2),P(:,3),'ko');
isosurface(X,Y,Z,F,0);
daspect([1 1 1])
view(3)
camlight, lighting phong;
quiver3(P(:,1), P(:,2),P(:,3),Normal(:,1),Normal(:,2),Normal(:,3),'r','LineWidth',2);
hold off

print(gcf,'-djpeg ', ['figure\implicit_function_n_' num2str(size(P,1)) '_Points_rect_' num2str(num_point) '_Rrbf_' num2str(r_rbf) '_poly_' num2str(coeff_poly) '_object_' num2str(object) '.jpg'])

