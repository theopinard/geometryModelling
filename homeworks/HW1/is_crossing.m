function [ result ] = is_crossing( P1, P2 )
%check if segment P1 and P2 are crossing
%   Detailed explanation goes here
a = cross_2D(P1(2,:) - P1(1,:), P2(1,:) - P1(1,:)) ...
    * cross_2D(P1(2,:) - P1(1,:), P2(2,:) - P1(1,:));

b = cross_2D(P2(2,:) - P2(1,:), P1(1,:) - P2(1,:)) ...
    * cross_2D(P2(2,:) - P2(1,:), P1(2,:) - P2(1,:));

result = a < 0 & b < 0; 

end

