function [ result ] = DphiDx3( x,y,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
m = size(y,1);
X3 = repmat(x(:,3),1,m);
Y3 = repmat(y(:,3),1,n);
x3 = (X3 -Y3')/r;
t = pdist2(x,y)/r;

result = (4.*x3.*(t - 1).^4)./t + (4.*x3.*(4.*t + 1).*(t - 1).^3)./t;
result(t > 1 ) = 0;
result(t == 0) = 0;

end