function [ P1,P2,P3 ] = create_points( N )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
P = rand(N,2);

P1 = 2 * P - 1; 
P2 = [P(:,1) .* cos(2 * pi * P(:,2)) P(:,1) .* sin(2 * pi * P(:,2))];
P3 = [cos(2 * pi * P(:,2)) sin(2 * pi * P(:,2))];

end

