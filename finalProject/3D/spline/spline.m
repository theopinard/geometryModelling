clear all
close all
clc


syms x1 x2 x3 r

t = sqrt(x1^2 + x2^2 + x3^2)

phi = t^4 * log(t)

D = gradient(phi,[x1 x2 x3]);
D1 = D(1)
D2 = D(2)
D3 = D(3)

H = hessian(phi,[x1 x2 x3]);
H11 = H(1,1)
H22 = H(2,2)
H33 = H(3,3)
H12 = H(1,2)
H13 = H(1,3)
H23 = H(2,3)

% phi =
%  
% log((x1.^2 + x2.^2 + x3.^2).^(1./2)).*(x1.^2 + x2.^2 + x3.^2).^2
%  
%  
% D1 =
%  
% x1.*(x1.^2 + x2.^2 + x3.^2) + 4.*x1.*log((x1.^2 + x2.^2 + x3.^2).^(1./2)).*(x1.^2 + x2.^2 + x3.^2)
%  
%  
% D2 =
%  
% x2.*(x1.^2 + x2.^2 + x3.^2) + 4.*x2.*log((x1.^2 + x2.^2 + x3.^2).^(1./2)).*(x1.^2 + x2.^2 + x3.^2)
%  
%  
% D3 =
%  
% x3.*(x1.^2 + x2.^2 + x3.^2) + 4.*x3.*log((x1.^2 + x2.^2 + x3.^2).^(1./2)).*(x1.^2 + x2.^2 + x3.^2)
%  
%  
% H11 =
%  
% 7.*x1.^2 + x2.^2 + x3.^2 + 8.*x1.^2.*log((x1.^2 + x2.^2 + x3.^2).^(1./2)) + 4.*log((x1.^2 + x2.^2 + x3.^2).^(1./2)).*(x1.^2 + x2.^2 + x3.^2)
%  
%  
% H22 =
%  
% x1.^2 + 7.*x2.^2 + x3.^2 + 8.*x2.^2.*log((x1.^2 + x2.^2 + x3.^2).^(1./2)) + 4.*log((x1.^2 + x2.^2 + x3.^2).^(1./2)).*(x1.^2 + x2.^2 + x3.^2)
%  
%  
% H33 =
%  
% x1.^2 + x2.^2 + 7.*x3.^2 + 8.*x3.^2.*log((x1.^2 + x2.^2 + x3.^2).^(1./2)) + 4.*log((x1.^2 + x2.^2 + x3.^2).^(1./2)).*(x1.^2 + x2.^2 + x3.^2)
%  
%  
% H12 =
%  
% 6.*x1.*x2 + 8.*x1.*x2.*log((x1.^2 + x2.^2 + x3.^2).^(1./2))
%  
%  
% H13 =
%  
% 6.*x1.*x3 + 8.*x1.*x3.*log((x1.^2 + x2.^2 + x3.^2).^(1./2))
%  
%  
% H23 =
%  
% 6.*x2.*x3 + 8.*x2.*x3.*log((x1.^2 + x2.^2 + x3.^2).^(1./2))
%  