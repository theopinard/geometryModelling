% Mesh Generation -- SME5827 -- ICMC-USP
% Author: Afonso Paiva -- apneto@icmc.usp.br
% Date: 2013/09/11
%
% Transfinite Interpolation (TFI)
%


clear all ;

% Resolucao dos eixos xi e eta
m = 10 ;
n = 10 ;

% Discretizando valores xi e eta
xi = linspace(0.,1,m) ;
eta = linspace(0.,1.,n) ;

% Alocando matrizes para os eixos X e Y
X = zeros(m,n) ;
Y = zeros(m,n) ;

% Fronteiras do dominio fisico

% Swan
Rb = @(s) ([s, 0]);
Rt = @(s) ([s, 1-3*s+3*s^2]);
Rl = @(s) ([0, s]);
Rr = @(s) ([1+2*s-2*s^2, s]);

% Chevron
% Rb = @(s) ([s,double(s<=0.5)*(-s)+double(s>0.5)*(s-1)]);
% Rt = @(s) ([s,double(s<=0.5)*(1-s)+double(s>0.5)*(s)]);
% Rl = @(s) ([0, s]);
% Rr = @(s) ([1, s]);

for i = 1:m
    Xi = xi(i) ;
    for j = 1:n
        Eta = eta(j) ;
        
        % TFI
        XY = (1-Eta)*Rb(Xi)+Eta*Rt(Xi)...
           + (1-Xi)*Rl(Eta)+Xi*Rr(Eta)...
           - (Xi*Eta*Rt(1)+Xi*(1-Eta)*Rb(1)+Eta*(1-Xi)*Rt(0)+(1-Xi)*(1-Eta)*Rb(0)) ;
    
        X(i,j) = XY(1) ;
        Y(i,j) = XY(2) ;
        
    end
end


% Plotando
figure
% set(gcf,'color','w') ;
% axis equal;
% axis off
% box on
hold on
for i=1:m
    plot(X(i,:),Y(i,:),'k','linewidth',1);
end
for j=1:n
    plot(X(:,j),Y(:,j),'k','linewidth',1);
end
hold off
