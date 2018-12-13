function [E,T] = op_remove_tri(E,T, trigs)
% [E,T] = op_remove_tri(E,T, trigs)
%
% Remove os os triangulos passados em trigs.
%
% Atencao 1: A remocao de um triangulo NAO remove seus vertices.
%
% Atencao 2: esta funcao usa a estrategia de `remocao preguicosa', isto e,
%            os triangulos apenas sao marcados como apagados, e nao retirados
%            das listas T. Um triangulo e dito removido quando seus vertices
%            tem como indice zeros, ou seja, [0,0,0].
%
%

if nargin ~= 3
    error('myApp:argChk', 'Wrong number of input arguments')
end

for kk=1:length(trigs)
  t = trigs(kk);

  %removendo os triangulos das estrelas
  vtcs = T(t,:);
  E{vtcs(1)} = E{vtcs(1)} ( E{vtcs(1)}~= t );
  E{vtcs(2)} = E{vtcs(2)} ( E{vtcs(2)}~= t );
  E{vtcs(3)} = E{vtcs(3)} ( E{vtcs(3)}~= t );

  % marcando como apagado
  T(t,:) = [0,0,0];
end






