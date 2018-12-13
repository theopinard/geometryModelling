function [ result ] = DphiDx1( x,y,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
m = size(y,1);
X1 = repmat(x(:,1),1,m);
Y1 = repmat(y(:,1),1,n);
result = -2/r^2 * (X1 -Y1' ) .*  exp(-pdist2(x,y).^2 / r^2);

end

