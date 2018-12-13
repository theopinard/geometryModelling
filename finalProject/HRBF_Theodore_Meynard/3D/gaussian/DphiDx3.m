function [ result ] = DphiDx3( x,y,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
m = size(y,1);
X3 = repmat(x(:,3),1,m);
Y3 = repmat(y(:,3),1,n);
result = -2/r^2 * (X3 - Y3') .*  exp(-pdist2(x,y).^2 / r^2);

end