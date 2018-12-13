function [ lambda ] = barycentric_coeff(P1,Tri)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
A = cross_2D(Tri(2,:)-Tri(1,:) , Tri(3,:) - Tri(1,:));

lambda(1) = cross_2D(Tri(2,:)-P1 , Tri(3,:) - P1) / A;
lambda(2) = cross_2D(Tri(3,:)-P1 , Tri(1,:) - P1) / A;
lambda(3) = cross_2D(Tri(1,:)-P1 , Tri(2,:) - P1) / A;

end

