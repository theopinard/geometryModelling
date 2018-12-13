function [ result ] = normais_por_face(V,T )
%area_superficie(V,T )
%   Detailed explanation goes here
temp = cross(V(T(:,2),:) - V(T(:,1),:),V(T(:,3),:) - V(T(:,1),:));
result = temp ./ repmat(sqrt(sum(temp.^2, 2)),1,3);

end



