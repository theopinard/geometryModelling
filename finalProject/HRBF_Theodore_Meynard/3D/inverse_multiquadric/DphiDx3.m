function [ result ] = DphiDx3( x,y,r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
n = size(x,1);
m = size(y,1);
X1 = repmat(x(:,1),1,m);
Y1 = repmat(y(:,1),1,n);
x1 = X1 -Y1';
X2 = repmat(x(:,2),1,m);
Y2 = repmat(y(:,2),1,n);
x2 = X2 -Y2';
X3 = repmat(x(:,3),1,m);
Y3 = repmat(y(:,3),1,n);
x3 = X3 -Y3';

result = -x3./(r.^2.*((x1.^2 + x2.^2 + x3.^2)./r.^2 + 1).^(3./2));


end