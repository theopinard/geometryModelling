function [ result ] = D2phiDx1Dx3( x,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
X1 = repmat(x(:,1),1,n);
X3 = repmat(x(:,3),1,n);
result = (4 / r^4 * (X1 - X1') .* (X3 - X3')) .*  exp(-pdist2(x,x).^2 / r^2);

end
