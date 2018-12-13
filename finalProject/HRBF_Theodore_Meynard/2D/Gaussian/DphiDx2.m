function [ result ] = DphiDx2( x,y,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
m = size(y,1);
X2 = repmat(x(:,2),1,m);
Y2 = repmat(y(:,2),1,n);
result = -2/r^2 * (X2 - Y2') .*  exp(-pdist2(x,y).^2 / r^2);

end
