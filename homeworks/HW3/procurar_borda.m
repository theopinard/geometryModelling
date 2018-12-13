function [ result ] = procurar_borda( E, T )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
N = size(T,1);
result = zeros(N,2);
k=1;
for i = 1:N;
    ind1 = T(i,1);
    ind2 = T(i,2);
    ind3 = T(i,3);
    if size(vertices_opostos( E, T, ind1, ind2 ),1) ==1;
        result(k,:) = [ind1,ind2];
        k = k+1;
    end
    if size(vertices_opostos( E, T, ind1, ind3 ),1) ==1;
        result(k,:) = [ind1,ind3];
        k = k+1;
    end
    if size(vertices_opostos( E, T, ind2, ind3 ),1) ==1;
        result(k,:) = [ind2,ind3];
        k=k+1;
    end

        
end
a =(result(:,1) ~= 0);
result = result(a,:);    
end

