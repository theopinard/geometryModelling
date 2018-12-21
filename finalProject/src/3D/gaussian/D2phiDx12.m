function [ result ] = D2phiDx12( x,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
X1 = repmat(x(:,1),1,n);
result = 2/r^2 * (-1 +  2 *(X1 - X1').^2/r^2) .*  exp(-pdist2(x,x).^2 / r^2);

end
