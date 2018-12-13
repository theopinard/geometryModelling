function [ result] = cross_2D(v1,v2);
%cross product of 2D vector (give the algebrical area)
%   Detailed explanation goes here
u1 = [v1 0];
u2 = [v2 0];
u3 = cross(u1,u2);
result = u3(3);
end

