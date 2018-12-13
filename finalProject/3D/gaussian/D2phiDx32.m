function [ result ] = D2phiDx32( x,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
X3 = repmat(x(:,3),1,n);
result = 2/r^2 * (-1 +  2 *(X3 - X3').^2/r^2) .*  exp(-pdist2(x,x).^2 / r^2);

end
