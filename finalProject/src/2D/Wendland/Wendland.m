clear all
close all
clc


syms x1 x2

t = sqrt(x1^2 + x2^2)

phi = (1 - t)^4 * (4 * t + 1)

D = gradient(phi,[x1 x2])

H = hessian(phi,[x1 x2])


% D =
%  
%  (4.*x1.*(t - 1).^4)./t + (4.*x1.*(4.*t + 1).*(t - 1).^3)./t
%  (4.*x2.*(t - 1).^4)./t + (4.*x2.*(4.*t + 1).*(t - 1).^3)./t
%  
%  
% H =
%  
% [ (4.*(t - 1).^4)./t + (4.*(4.*t + 1).*(t - 1).^3)./t + (32.*x1.^2.*(t - 1).^3)./(t.^2) - (4.*x1.^2.*(t - 1).^4)./(t.^2).^(3./2) + (12.*x1.^2.*(4.*t + 1).*(t - 1).^2)./(t.^2) - (4.*x1.^2.*(4.*t + 1).*(t - 1).^3)./(t.^2).^(3./2),                                                                                                                                     (32.*x1.*x2.*(t - 1).^3)./(t.^2) - (4.*x1.*x2.*(t - 1).^4)./(t.^2).^(3./2) + (12.*x1.*x2.*(4.*t + 1).*(t - 1).^2)./(t.^2) - (4.*x1.*x2.*(4.*t + 1).*(t - 1).^3)./(t.^2).^(3./2)]
% [                                                                                                                                     (32.*x1.*x2.*(t - 1).^3)./(t.^2) - (4.*x1.*x2.*(t - 1).^4)./(t.^2).^(3./2) + (12.*x1.*x2.*(4.*t + 1).*(t - 1).^2)./(t.^2) - (4.*x1.*x2.*(4.*t + 1).*(t - 1).^3)./(t.^2).^(3./2), (4.*(t - 1).^4)./t + (4.*(4.*t + 1).*(t - 1).^3)./t + (32.*x2.^2.*(t - 1).^3)./(t.^2) - (4.*x2.^2.*(t - 1).^4)./(t.^2).^(3./2) + (12.*x2.^2.*(4.*t + 1).*(t - 1).^2)./(t.^2) - (4.*x2.^2.*(4.*t + 1).*(t - 1).^3)./(t.^2).^(3./2)]
%  

