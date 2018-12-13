function [ Po ] = P_mat3D( P )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N = size(P,1);
n = size(P,2);

Po1 = [ones(N,1); zeros(n * N,1)]; %1
Pox = [P(:,1);ones(N,1);zeros(2* N,1)]; %x
Poy = [P(:,2);zeros(N,1);ones(N,1);zeros(N,1)]; %y
Poz = [P(:,3);zeros(2* N,1);ones(N,1)]; %z

Poxy = [P(:,1).*P(:,2); P(:,2); zeros(2*N,1)]; %xy
Poxz = [P(:,1).*P(:,3); P(:,3); zeros(N,1);P(:,1)]; %xz
Poyz = [P(:,2).*P(:,3); zeros(N,1);P(:,3);P(:,2)]; %yz

Poxx = [P(:,1).^2; 2*P(:,1); zeros(2*N,1)]; %x^2
Poyy = [P(:,2).^2; zeros(N,1); 2*P(:,2); zeros(N,1)]; %y^2
Pozz = [P(:,3).^2; zeros(2*N,1); 2*P(:,3)]; %z^2


Po = [Po1,Pox,Poy,Poz,Poxy,Poxz,Poyz,Poxx,Poyy,Pozz];
end