clear all
close all
clc

run test2

ind1 = 200;
ind2 = 6;
k=2;

one_anel(E, T, 5)

vertices_opostos( E, T, 5, 6 )

numero_vertices_vizinhos( E, T, 6, 12 )

result = k_anel(E, T, 200 ,6)

dist = distancia( E, T, ind1, ind2 );
dist

indt1 = 800;
indt2 = 799;

[ result2 ] = procurar_borda( E, T );


area_superficie(V,T );

alpha = 1;

[ V ] = suavizacao( V,E,T,alpha,2 );


figure;
hold on
trimesh(T,V(:,1),V(:,2),V(:,3),'FaceColor','interp','FaceLighting','phong','EdgeColor','black');
for k=1:length(V);
    text(V(k,1),V(k,2),V(k,3),['  ' num2str(k)]);
end

for k = result'
    plot3(V(k,1),V(k,2),V(k,3),'r*')
end

for k = 1:size(result2,1)
    plot3(V(result2(k,:),1),V(result2(k,:),2),V(result2(k,:),3),'b','LineWidth',4)
end
hold off
%% test2

run test1



[V, E,T] = flip(V, E, T, 5, 15);
[V, E,T] = flip(V, E, T, 1, 9);
[ V2 ] = suavizacao( V,E,T,1,1 );



figure;
hold on
trimesh(T,V(:,1),V(:,2),V(:,3),'FaceColor','interp','FaceLighting','phong','EdgeColor','black');
for k=1:length(V);
    text(V(k,1),V(k,2),V(k,3),['  ' num2str(k)]);
end
title('com os flip sem suavisacao')

figure;
hold on
trimesh(T,V2(:,1),V2(:,2),V2(:,3),'FaceColor','interp','FaceLighting','phong','EdgeColor','black');
for k=1:length(V);
    text(V2(k,1),V2(k,2),V2(k,3),['  ' num2str(k)]);
end
title('com os flip com suavisacao')
hold off
%% test3

run test3

razao_de_aspecto( V,T );
title('antes da suavizacao')


V = suavizacao( V,E,T,1, 10);
razao_de_aspecto( V,T );
title('depois da suavizacao 10 iteracao')

V = suavizacao( V,E,T,1, 30);
razao_de_aspecto( V,T );
title('depois da suavizacao 30 iteracao')

figure;
hold on
trimesh(T,V(:,1),V(:,2),V(:,3),'FaceColor','interp','FaceLighting','phong','EdgeColor','black');
title('com suavisacao')



