clear;

% a malha e definida pela tupla (V,E,T)
%
% V : matriz de coordenadas, Nv por 3, onde Nv numero de vertices.
% E : lista de estrelas dos vertices. E{i}[j] = j-esimo triangulo incidente do vertice i
% T : matriz de triangulos. T(i,j) = j-esimo vertice do triangulo i



% inicializando corretamente
V = zeros(0,3);   % matriz vazia
E{1} = [];
T = zeros(0,3);

[x,y] = meshgrid(1:21,1:21);
x=x(:); y=y(:);

Taux = delaunay(x,y);

z = 0*x ;

[V,E] = op_insere_vtc(V,E, [x,y,z]);

[E,T] = op_insere_tri(E,T, Taux);

%[E,T] = op_remove_tri(E,T, [3,8]);

%[V,E,T] = op_limpa_lixo(V,E,T);

%trimesh(T,V(:,1),V(:,2),V(:,3),'FaceColor','interp','FaceLighting','phong','EdgeColor','black');
%trimesh(Taux,x,y,z,'FaceColor','interp','FaceLighting','phong','EdgeColor','black');

trimesh(T,V(:,1),V(:,2),V(:,3));

