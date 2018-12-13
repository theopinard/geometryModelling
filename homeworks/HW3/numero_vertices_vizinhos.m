function [ result ] = numero_vertices_vizinhos( E, T, ind1, ind2 )
%vertices_opostos( E, T, ind1, ind2 )
%   Detailed explanation goes here
result = size(intersect(one_anel(E, T, ind1), one_anel(E, T, ind2)),1);

end

