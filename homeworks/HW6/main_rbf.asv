
%% Input data
clear;
load bunny.mat;

%% Solve linear system
shift = 1e-3;

[alpha,centers] = rbf_solver(P,N,shift);

%% Eval RBF implicits
n = 40;
t = linspace(-1,1,n);
[X,Y,Z] = meshgrid(t);


points_in = [X(:) Y(:) Z(:)];
F = rbf_evaluate([X(:) Y(:) Z(:)],centers,alpha);


F = reshape(F,[n,n,n]);

%% Draw all
hold on
plot3(P(:,1),P(:,2),P(:,3),'ko');
isosurface(X,Y,Z,F,0);
daspect([1 1 1])
view(3), camlight, lighting phong;
hold off