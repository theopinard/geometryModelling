function [ result] = cross_2D(v1,v2);
%cross product of 2D vector (give the algebrical area)
%   Detailed explanation goes here
if size(v2,1) ==1;
    u1 = [v1 zeros(size(v1,1),1)];
    u2 = repmat([v2 0],size(v1,1),1);
    u3 = cross(u1,u2,2);
    result = u3(:,3);
elseif size(v1,1) ==1
    u1 = repmat([v1 0],size(v2,1),1);
    u2 = [v2 zeros(size(v2,1),1)];
    u3 = cross(u1,u2,2);
    result = u3(:,3);
else
    u1 = [v1 zeros(size(v1,1),1)];
    u2 = [v2 zeros(size(v2,1),1)];
    u3 = cross(u1,u2,2);
    result = u3(:,3);
end

