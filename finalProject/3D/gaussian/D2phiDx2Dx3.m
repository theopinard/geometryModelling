function [ result ] = D2phiDx2Dx3( x,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
X2 = repmat(x(:,2),1,n);
X3 = repmat(x(:,3),1,n);
result = (4 / r^4 * (X2 - X2') .* (X3 - X3')) .*  exp(-pdist2(x,x).^2 / r^2);

end
