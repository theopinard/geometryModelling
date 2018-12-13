function [ V_out ] = suavizacao( V,E,T,alpha,k )
%suavizacao( V,E,T,alpha )
%   Detailed explanation goes here
N = normais_por_vertice(V,E,T);
frontier = procurar_borda( E, T );
frontier = unique(frontier(:));

V_out = zeros(size(V));
V_iter = V;
for iter = 1:k
    
for i = 1:size(V,1);
    v = V_iter(i,:);
    if ismember(i,frontier);
        V_out(i,1:3) = v;
    else
        points = one_anel(E, T, i);
        b = mean(V_iter(points,:),1);
        n = N(i,:);
        d = b - v;
        V_out(i,1:3) = v + alpha * (d - (d * n') * n);
    end

end
V_iter = V_out;
end

end

