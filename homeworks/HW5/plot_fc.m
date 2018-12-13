function [ T ] = plot_fc( V,T )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
figure;
hold on
trimesh(T,V(:,1),V(:,2),V(:,3),'FaceColor','interp','FaceLighting','phong','EdgeColor','black');


for i = 1:size(V,1)
    plot3(V(i,1),V(i,2),V(i,3),'*')
end
for i=1:size(V,1);
    text(V(i,1),V(i,2),V(i,3),['  ' num2str(i)]);
end

end

