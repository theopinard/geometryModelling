function [ result ] = sao_adjacentes( T,indt1,indt2 )
%sao_adjacentes( T,indt1,indt2 )
%   Detailed explanation goes here
temp = intersect(T(indt1,:),T(indt2,:));
result = size(temp,2)==2;

end

