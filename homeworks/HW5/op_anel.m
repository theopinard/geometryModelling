function anel = op_anel(E,T, v)
% function anel = op_anel(E,T, v)
%
% retorna o anel do vertice v
%

if nargin ~= 3
    error('myApp:argChk', 'Wrong number of input arguments')
end

S = E{v}; % estrela de v

if (isempty(S))
	anel = [];
	return;
end


anel = [0];

for i=1:length(S)

	anel = [anel, T(S(i), :)];

end

anel = unique(anel);

anel(anel==0) = [];
anel(anel==v) = [];







