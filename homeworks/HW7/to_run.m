clear all
close all
clc

clc 
clear all ;

% Resolucao dos eixos xi e eta
m = 30 ;
n = 30 ;

% Discretizando valores xi e eta
xi = linspace(0.,1,m) ;
eta = linspace(0.,1.,n) ;
dxi = xi(2)-xi(1);
deta = eta(2) - eta(1);

[xi eta] = meshgrid(xi, eta);

% Alocando matrizes para os eixos X e Y
X = zeros(m,n) ;
Y = zeros(m,n) ;

% Fronteiras do dominio fisico

% Swan

Rb_xi = xi;
Rb_eta = zeros(size(xi));
Rt_xi = xi;
Rt_eta = 1 - 3*xi + 3 * xi.^2;

Rl_xi = zeros(size(eta));
Rl_eta = eta;
Rr_xi = 1 + 2 * eta - 2 * eta.^2;
Rr_eta = eta;


% Chevron

% Rb_xi = xi;
% Rb_eta = double(xi<=0.5).*(-xi)+double(xi>0.5).*(xi-1);
% Rt_xi = xi;
% Rt_eta = double(xi<=0.5).*(1-xi)+double(xi>0.5).*(xi);
% 
% Rl_xi = zeros(size(eta));
% Rl_eta = eta;
% Rr_xi = ones(size(eta));
% Rr_eta = eta;



A = [Rb_xi(1,1) Rb_eta(1,1)];
B = [Rt_xi(1,1) Rt_eta(1,1)];
C = [Rr_xi(1,1) Rr_eta(1,1)];
D = [Rt_xi(end,end) Rt_eta(end,end)];


X = (1-xi) .* Rl_xi + xi .* Rr_xi + (1-eta) .* Rb_xi + eta .* Rt_xi ...
    -((1-xi) .* (1-eta) * A(1) + (1 - xi) .* eta * B(1) + xi .* (1 - eta) * C(1) + xi .* eta * D(1));

Y = (1-xi) .* Rl_eta + xi .* Rr_eta + (1-eta) .* Rb_eta + eta .* Rt_eta ...
    -((1-xi) .* (1-eta) * A(2) + (1 - xi) .* eta * B(2) + xi .* (1 - eta) * C(2) + xi .* eta * D(2));


epsilon = 1;
k = 0;
while epsilon >1e-6;
    g1_X = (X(2:end-1,3:end) - X(2:end-1,1:end-2)) / (2 * dxi);
    g1_Y = (Y(2:end-1,3:end) - Y(2:end-1,1:end-2)) / (2 * deta);

    g2_X = (X(3:end,2:end-1) - X(1:end-2,2:end-1)) / (2 * dxi);
    g2_Y = (Y(3:end,2:end-1) - Y(1:end-2,2:end-1)) / (2 * deta);

    g11 = g1_X .^2 + g1_Y .^2;
    g22 = g2_X .^2 + g2_Y .^2;
    g12 = g1_X .* g2_X + g1_Y .* g2_Y;

    a = 4 * deta^2 * g22;
    b = 4 * deta * dxi * g12;
    c = 4 * dxi^2 * g11;
    
    X_old = X;
    Y_old = Y;
    X(2:end-1,2:end-1) = 1 ./ (2 * (a + c)) .* ( a .* (X(2:end-1,3:end) + X(2:end-1,1:end-2)) ...
        + c .* (X(3:end,2:end-1) + X(1:end-2,2:end-1)) ...
        - 0.5 * b .* (X(3:end,3:end)+X(1:end-2,1:end-2) - X(3:end,1:end-2) - X(1:end-2,3:end)));

    Y(2:end-1,2:end-1) = 1 ./ (2 * (a + c)) .* ( a .* (Y(2:end-1,3:end) + Y(2:end-1,1:end-2)) ...
        + c .* (Y(3:end,2:end-1) + Y(1:end-2,2:end-1)) ...
        - 0.5 * b .* (Y(3:end,3:end)+Y(1:end-2,1:end-2) - Y(3:end,1:end-2) - Y(1:end-2,3:end)));
    epsilon = sum(sum(sqrt((X-X_old).^2+ (Y-Y_old).^2))) / (m*n);
    k = k+1;
end
k


% Plotando
figure
set(gcf,'color','w') ;
axis equal;
axis off
box on
hold on
plot(X,Y,'k')
plot(X',Y','k')