function [ result ] = lambdar3( r, q, s, p , V )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
u1 = [V(r,:) 1];
u2 = [V(q,:) 1];
u3 = [V(s,:) 1];
u4 = [V(p,:) 1];

result = det([u1;u2;u3;u4]);

end

