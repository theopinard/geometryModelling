clear all
close all
clc

%
% Mesh Generation -- SME0250 -- ICMC-USP
% Author: Afonso Paiva -- apneto@icmc.usp.br
% Date: 2014/05/20
%
% Stretching 1D
%


L = 2;
xc = 1.0; 
A = 2.5; 
n = 32;
s = linspace(0,1,n);

for i=1:n
    x(i)=L*s(i)+A*(xc-L*s(i))*s(i)*(1-s(i)); % internal layer
    %x(i)= 2*sqrt(s(i)); % boundary layer
end
figure
hold on

plot(s,x,'LineWidth',1);

for i=1:n
    plot([s(i),s(i)],[0.0, x(i)],'b');
    plot([0.0,s(i)],[x(i), x(i)],'b');
end

xlabel('\xi','Fontsize',18)
ylabel('x','Fontsize',18)
%set(gca,'Box','on'); 
%set(gca,'Fontsize',18, 'LineWidth',2)
plot([0,1],[0,L],'r')
%text(0.05,L-0.1,['A=',num2str(A),' x=',num2str(xc)],'Fontsize',18);
hold off;

%% 2D
% 
% L = 2;
% xc_1 = 1.0;
% 
% A = 2.5; 
% n = 50;
% s = linspace(0,1,n);

[X,Y] = meshgrid(s);

X_out = L*X+A*(xc-L*X).*X.*(1-X);
Y_out = L*Y+A*(xc-L*Y).*Y.*(1-Y);

figure
hold on
plot(X_out,Y_out,'b')
pause
plot(X_out',Y_out','b')


