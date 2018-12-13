function [ result ] = D2phiDx1Dx3( x,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
X1 = repmat(x(:,1),1,n);
X2 = repmat(x(:,2),1,n);
X3 = repmat(x(:,3),1,n);
x1 = X1 - X1';
x2 = X2 - X2';
x3 = X3 - X3';


result = (3.*x1.*x3)./(r.^4.*((x1.^2 + x2.^2 + x3.^2)./r.^2 + 1).^(5./2));


end
