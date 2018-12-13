clear all
close all
clc

N = 20;

P = rand(N,2);
P(:,3) = zeros(size(P(:,1)));

[ V,E,T ] = graham_tri( P );
plot_fc(V,T );
title('Graham s triangulation')




[ V,E,T ] = swapedges( V,E,T );
plot_fc(V,T );
title('Delaunay s triangulation with swapedges')

[V,E,T] = Delaunay_tria( P );
plot_fc(V,T );
title('Delaunay s triangulation with paraboloids')

T = delaunay(P(:,1),P(:,2));
V(:,1) = P(:,1);
V(:,2) = P(:,2);
V(:,3) = 0 * P(:,1);
plot_fc(V,T );
title('Delaunay s triangulation from matlab')
%% conputation time

N = [10 20 50 70 100];% 200 500 1000];

for i = 1:size(N,2)
    n = N(i);
    P = rand(n,2);
    P(:,3) = zeros(size(P(:,1)));
    a(i,:) = speed_comparison( P );
end
colours = ['-*m';'-^c';'-+r';'-*g';'-+b'];


figure;
hold on
for i = 1:size(a,2);
    
    plot(N,log(a(:,i)),colours(i,:))
end
xlabel('N')
ylabel('log of comutacional time with t in [s]')
legend('Graham s triangulation','Delaunay s triangulation with swapedges',...
   'Delaunay s triangulation with paraboloids','Delaunay s triangulation from matlab' ,'location', 'NorthWest')
title('Time vs number of point for random point in the unit square')













