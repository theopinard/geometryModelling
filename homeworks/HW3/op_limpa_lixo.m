function [V,E,T] = op_limpa_lixo(V,E,T)
% [V,E,T] = op_limpa_lixo(V,E,T)
%
% Restaura a numeracao perdida com as operacoes de remocao.
%
%

if nargin ~= 3
    error('myApp:argChk', 'Wrong number of input arguments')
end


% primeiro tem que limpar os triangulos

Nt_old = size(T,1);
Nv_old = size(V,1);


for i=Nt_old:-1:1
  
  if T(i,1) == 0
    T(i,:) = [];

    for k=1:Nv_old
      E{k}(E{k}>i) = E{k}(E{k}>i) - 1;
    end

  end

end


% depois, limpa os vertices

for i=Nv_old:-1:1

  if isempty(E{i})

    % remove de fato
    E(i) = [];
    V(i,:) = [];

    % conserta a numeracao
    T(T>i) = T(T>i) - 1;

  end
end


