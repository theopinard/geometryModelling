function [ result ] = D2phiDx32( x,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
X1 = repmat(x(:,1),1,n);
X2 = repmat(x(:,2),1,n);
X3 = repmat(x(:,3),1,n);
x1 = (X1 - X1')/r;
x2 = (X2 - X2')/r;
x3 = (X3 - X3')/r;

t = pdist2(x,x)/r;

result = (4.*(t - 1).^4)./t + (32.*x3.^2.*(t - 1).^3)./(t.^2) - (4.*x3.^2.*(t - 1).^4)./(t.^2).^(3./2) + (4.*(4.*t + 1).*(t - 1).^3)./t + (12.*x3.^2.*(4.*t + 1).*(t - 1).^2)./(t.^2) - (4.*x3.^2.*(4.*t + 1).*(t - 1).^3)./(t.^2).^(3./2);

result(t > 1 ) = 0;
result(t == 0) = 0;

end
