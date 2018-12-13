function [ result ] = DphiDx1( x,y,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
m = size(y,1);
X1 = repmat(x(:,1),1,m);
Y1 = repmat(y(:,1),1,n);
x1 = (X1 -Y1')/r;
t = pdist2(x,y)/r;

result = (4.*x1.*(t - 1).^4)./t + (4.*x1.*(4.*t + 1).*(t - 1).^3)./t;
result(t > 1 ) = 0;
result(t == 0) = 0;


end

