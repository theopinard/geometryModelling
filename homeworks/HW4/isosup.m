function [ result ] = isosup( X )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
x = X(:,1);
y = X(:,2);
z = X(:,3);

result = (2* x.^2+ y.^2+ z.^2 - 1 ).^3 - (x.^2 / 10 + y.^2) .* z.^3;

end

