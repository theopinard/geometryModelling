function [ ind] = find_T( a,b,c,T )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
A = (T == a) * ones(3,1);
B = (T == b) * ones(3,1);
C = (T == c) * ones(3,1);

ind = find(A & B & C); 
end

