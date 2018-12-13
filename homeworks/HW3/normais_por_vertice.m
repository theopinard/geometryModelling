function [ result ] = normais_por_vertice(V,E,T)
%normais_por_vertice(V,E,T)
%   Detailed explanation goes here
N = cross(V(T(:,2),:) - V(T(:,1),:),V(T(:,3),:) - V(T(:,1),:));
result = zeros(size(V));
for i = 1:size(V,1);
    T_edge = E{i};
    result(i,:) = mean(N(T_edge,:),1);
end

result = result ./ repmat(sqrt(sum(result.^2, 2)),1,3);

end
