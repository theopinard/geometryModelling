function [V,E] = op_insere_vtc(V,E, X)
% function V = op_insere_vtc(V,X)
%
% Insere os vertices em X na malha.
%
% X e uma matriz Nv por 3, onde Nv e o numero de
% vertices a serem inseridos. Portanto,
% X(i,j) refere-se a componente j do vertice i.
%
% Esta funcao mantem a consistencia da malha.
%
% <sarcasmo> cuidado, esta funcao eh muito complicada </sarcasmo>

if nargin ~= 3
    error('myApp:argChk', 'Wrong number of input arguments')
end

if isempty(V)
  V = X;
else
  V = vertcat(V,X);
end

E{size(V,1)} = [];


