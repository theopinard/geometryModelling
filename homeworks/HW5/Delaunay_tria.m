function [V,E,T] = Delaunay_tria( P )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

P(:,3) = P(:,1) .^2 + P(:,2) .^2;
[~,I] = sort(P(:,3));

[ V,E,T ] = Convex_hull( P );


a = T(:,1);
b = T(:,2);
c = T(:,3);
S = cross(P(b,:)-P(a,:),P(c,:)-P(a,:));
result = (S(:,3) > 0);
ind_T = find(result);
[E,T] = op_remove_tri (E ,T , ind_T );
[V,E,T] = op_limpa_lixo(V,E,T);
V(:,3) = 0 * V(:,3);
end

