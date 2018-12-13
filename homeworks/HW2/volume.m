function vol = volume(F,V)
    vol = 0;    
    C = sum(V,1) / size(V,1);
    nf = size(F,1);
    for i = 1:nf;
       v1 = V(F(i,1),:);
       v2 = V(F(i,2),:);
       v3 = V(F(i,3),:);
       vol = vol +  area_tetra(v1,v2,v3,C);
    end
    vol = abs(vol)
end

