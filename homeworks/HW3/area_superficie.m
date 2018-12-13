function [ result ] = area_superficie(V,T )
%area_superficie(V,T )
%   Detailed explanation goes here
temp = cross(V(T(:,2),:) - V(T(:,1),:),V(T(:,3),:) - V(T(:,1),:));
result = sum(sqrt(sum(temp.^2, 2))) / 2;

end

