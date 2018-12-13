function [ result ] = lambdar2( r, q, p , V )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
u1 = [V(r,1:2) 1];
u2 = [V(q,1:2) 1];
u3 = [V(p,1:2) 1];

result = det([u1;u2;u3]);

end

