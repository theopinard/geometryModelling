function [ result ] = phi_l( d,r )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

result = exp(-((d.^2) * ones(size(d,2),1) / r^2));


end

