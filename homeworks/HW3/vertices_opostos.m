function [ result ] = vertices_opostos( E, T, ind1, ind2 )
%vertices_opostos( E, T, ind1, ind2 )
%   Detailed explanation goes here
result = intersect(one_anel(E, T, ind1), one_anel(E, T, ind2));

end

