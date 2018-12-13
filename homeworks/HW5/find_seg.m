function [ ind_T ] = find_seg( segment,T )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
A = (T == segment(1)) * ones(3,1);
B = (T == segment(2)) * ones(3,1);
ind_T = find( A & B );

end

