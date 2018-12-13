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

[Vaux,Taux] = read_obj('malhas/bunny.obj');

[V,E] = op_insere_vtc(V,E, Vaux);

[E,T] = op_insere_tri(E,T, Taux);

trimesh(T,V(:,1),V(:,2),V(:,3),'FaceColor','interp','FaceLighting','phong','EdgeColor','black');
%trimesh(T,V(:,1),V(:,2),V(:,3));
%trimesh(Taux,Vaux(:,1),Vaux(:,2),Vaux(:,3),'FaceColor','interp','FaceLighting','phong','EdgeColor','black');
