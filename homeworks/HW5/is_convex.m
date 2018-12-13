function [ result ] = is_convex( q1,q2,q3 )
% see if 3 points are convex or not
%   Detailed explanation goes here
v1 = q2 - q1;
v2 = q3 - q2;
a = dot(cross(v1,v2),[0 0 1]);
result = a >= 0;
end

