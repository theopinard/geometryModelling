function [ result ] = D2phiDx22( x,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
X2 = repmat(x(:,2),1,n);
result = 2/r^2 * (-1 +  2 *(X2 - X2').^2/r^2) .*  exp(-pdist2(x,x).^2 / r^2);

end
