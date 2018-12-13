clear all
close all
clc

n = 20;
t = linspace(0,1,n);

A = [0 0];
B = [1 1];
C = [0 2];
D = [1 2];

[X,Y] = meshgrid(t);

X_out = (1-X) .* (1-Y) * A(1) + (1 - X) .* Y * B(1) + X .* (1 - Y) * C(1) + X .* Y * D(1);
Y_out = (1-X) .* (1-Y) * A(2) + (1 - X) .* Y * B(2) + X .* (1 - Y) * C(2) + X .* Y * D(2);

figure
plot(X_out,Y_out,'b*')