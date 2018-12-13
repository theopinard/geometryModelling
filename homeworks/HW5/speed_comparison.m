function [ a ] = speed_comparison( P )
%
%   Detailed explanation goes here
tic
[ V,E,T ] = graham_tri( P );
a(1) = toc;

tic
swapedges( V,E,T );
a(2) = toc;

tic
Delaunay_tria( P );
a(3) = toc;

tic
delaunay(P(:,1),P(:,2));
a(4) = toc;



end

