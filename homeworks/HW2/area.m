function [ result ] = area( q1,q2,q3 )
% see if 3 points are convex or not
%   Detailed explanation goes here
v1 = q2 - q1;
v2 = q3 - q1;
result = cross_2D(v1,v2);
end
