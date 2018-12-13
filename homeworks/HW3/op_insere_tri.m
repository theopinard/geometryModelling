function [E,T] = op_insere_tri(E,T, new_trigs)
% [E,T] = op_insere_tri(E,T, new_trigs)
%
% Insere elementos na malha consistentemente.
%
% new_trigs e uma matriz Nx3 com os vertices dos novos triangulos:
% new_trigs(i,j) = j-esimo vertice do triangulo i.
%
% O indice dos triangulos inseridos comecam a partir de size(T,1)+1.
%
% Esta funcao mantem a consistencia da malha.
%

if nargin ~= 3
    error('myApp:argChk', 'Wrong number of input arguments')
end

Nt_old = size(T,1);
N_adds = size(new_trigs,1);

% adicionando o triangulo na lista
if isempty(T)
  T = new_trigs;
else
  T = vertcat(T,new_trigs);
end


% para cada aresta do novo triangulo, encontra o triangulo adjacente
for n=1:N_adds
  c_idx = Nt_old+n;
  % adiciona este triangulo a lista de estrela dos vertices
  E{new_trigs(n,1)} = unique([E{new_trigs(n,1)}, c_idx]);
  E{new_trigs(n,2)} = unique([E{new_trigs(n,2)}, c_idx]);
  E{new_trigs(n,3)} = unique([E{new_trigs(n,3)}, c_idx]);
end






