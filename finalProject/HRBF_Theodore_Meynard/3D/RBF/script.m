clear all
close all
clc
%% Input data
shift = 1e-3;

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
    a= 0.2; b = 0.5;
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
%% Solve linear system
shift = 1e-3;

[alpha,centers] = rbf_solver(P,Normal,shift);

%% Eval RBF implicits
n = 20;

t = linspace(-1.2*max(max(P)),1.2*max(max(P)),n);
[X,Y,Z] = meshgrid(t);


points_in = [X(:) Y(:) Z(:)];
F = rbf_evaluate([X(:) Y(:) Z(:)],centers,alpha);


F = reshape(F,[n,n,n]);

%% Draw all
figure
hold on

isosurface(X,Y,Z,F,0);
daspect([1 1 1])
view(3), camlight, lighting phong;
quiver3(P(:,1), P(:,2),P(:,3),Normal(:,1),Normal(:,2),Normal(:,3),'r','LineWidth',2);
hold off