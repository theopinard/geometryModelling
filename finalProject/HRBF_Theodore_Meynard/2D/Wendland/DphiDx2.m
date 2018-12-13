function [ result ] = DphiDx2( x,y,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
m = size(y,1);
X2 = repmat(x(:,2),1,m);
Y2 = repmat(y(:,2),1,n);
x2 =(X2 -Y2')/r;
t = pdist2(x,y)/r;

result = (4.*x2.*(t - 1).^4)./t + (4.*x2.*(4.*t + 1).*(t - 1).^3)./t;
result(t > 1 ) = 0;
result(t == 0) = 0;

end
