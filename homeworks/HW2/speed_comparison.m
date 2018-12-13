function [ a ] = speed_comparison( P )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

tic,
idx = jarvis2D(P);
a(1) = toc ;


tic,
idx = graham2D( P );
a(2) = toc ;

tic,
idx = incremental( P );
a(3) = toc ;

tic,
idx = quickhull( P );
a(4)= toc ;

tic,
idx = convhull(P);
a(5) =toc; 


end

