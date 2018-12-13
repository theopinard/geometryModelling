function [ t ] = pseudo_angle( P )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
y = [1 0];
t = (1 - P * y' / norm(P)) * sign(P(2));

end

