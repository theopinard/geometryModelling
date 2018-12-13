function [ result ] = phi( d,r )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
result = exp(-((d(:,1).^2 + d(:,2).^2) / r^2));

end

