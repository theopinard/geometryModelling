function [ Po ] = P_mat2D( P )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N = size(P,1);
n = size(P,2);

Po1 = [ones(N,1); zeros(n * N,1)]; %1

Pox = [P(:,1);ones(N,1);zeros(N,1)]; %x
Poy = [P(:,2);zeros(N,1);ones(N,1)]; %y

Poxy = [P(:,1).*P(:,2);P(:,2);P(:,1)]; %xy

Poxx = [P(:,1).^2; 2*P(:,1); zeros(N,1)]; %x^2
Poyy = [P(:,2).^2; zeros(N,1); 2*P(:,2)]; %y^2

Po = [Po1,Pox,Poy,Poxy,Poxx,Poyy];
end