function [ result ] = D2phiDx2Dx3( x,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
X1 = repmat(x(:,1),1,n);
X2 = repmat(x(:,2),1,n);
X3 = repmat(x(:,3),1,n);
x1 = X1 - X1';
x2 = X2 - X2';
x3 = X3 - X3';

result = 6.*x2.*x3 + 8.*x2.*x3.*log((x1.^2 + x2.^2 + x3.^2).^(1./2));

result((x1.^2 + x2.^2 + x3.^2)==0) = 0;
end
