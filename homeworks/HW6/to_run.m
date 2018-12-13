clear all
close all
clc

N = 200;
num_point = 5;
t = linspace(0,2*pi, N);


P = [cos(t'), sin(t')];
N = [cos(t'), sin(t')];

rectangle = [-2 -2;-2 2;2 2;2 -2];
tic
[ rectangle,a ] = divide( P,rectangle, num_point);
toc

shift = 1e-3; 
%Solve linear system
tic

alpha = cell(1,size(a,2));
centers = cell(1,size(a,2));
center = zeros(size(a,2),2);
r = zeros(size(a,2),1);
for i = 1:size(a,2)
    P_in = P(a(:,i)==1,:);
    N_in = N(a(:,i)==1,:);
    rectangle_in = squeeze(rectangle(:,:,i));
    [alpha{i},centers{i}] = rbf_solver(P_in,N_in,shift);
    center(i,:) = mean(rectangle_in);
    r(i) = 0.5 * norm(rectangle_in(1,:)-rectangle_in(3,:));
end
toc
% Eval RBF implicits
n = 500;
t = linspace(-2,2,n);
[X,Y] = meshgrid(t);
points_in = [X(:) Y(:)];
F = zeros(size(points_in,1),1);

tic
s= zeros(n^2,1);
for j = 1:size(a,2);
    F = F + phi(points_in-repmat(center(j,:),n^2,1),r(j)) .* rbf_evaluate(points_in,centers{j},alpha{j});
    s = s + phi(points_in-repmat(center(j,:),n^2,1),r(j));
end
    
F = F ./ s;
toc    

F = reshape(F,[n,n]);


figure;
contourf(X,Y,F)

figure
hold on 
plot(P(:,1), P(:,2), '*')
quiver(P(:,1), P(:,2),N(:,1), N(:,2),'b');

for k=1:size(P,1);
    text(P(k,1), P(k,2),['  ' num2str(k)]);
end

for ii = 1:size(a,2)
    plot(P(a(:,ii) == 1,1),P(a(:,ii) == 1,2), 'ro')
    plot(rectangle([1 2 3 4 1],1,ii), rectangle([1 2 3 4 1],2,ii),'--')

end


