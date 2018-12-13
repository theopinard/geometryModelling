function [ V,E,T ] = add_new_triangle(V,E,T, points )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
for i = 1:3
    [Lia,Locb]=ismember(points(i,:),V,'rows');
    if  Lia;
        newtrigs(i) = Locb;
    else
        [V,E] = op_insere_vtc(V,E,points(i,:));
        newtrigs(i) = size(V,1);
    end
    

end


[E,T] = op_insere_tri(E,T, newtrigs);

end

