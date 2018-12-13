function [ V,E,T ] = graham_tri( P )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[~, idx] = min(P(:,2));
a= idx(1);
y = [1 0 0];
for i = 1:size(P,1);
    theta(i) = pseudo_angle(P(i,:)- P(idx(1),:),y );
end

[~, I] = sort(theta);
I = [idx I];
idx(2) = I(2);
b = I(2);
c = I(3);
T_ini =  [a,b,c];

V = zeros(0,3); 
E{1} = [];
T = zeros(0,3);

[V,E] = op_insere_vtc(V,E,P);
%[E,T] = op_insere_tri(E,T,T_ini);

k = 2;
for i= 3:size(I,2)-1
    d = I(i);
    idx_old = idx(k);
    while k > 1 & ~is_convex(P(idx(k-1),:),P(idx(k),:),P(I(i),:));
        T1 = [idx(k) idx(k-1) I(i)];
        [E,T] = op_insere_tri(E,T,T1);
        k = k-1;
    end
    k = k+1;
    idx(k) = I(i);
    %T2 = [idx(1) I(i) idx(k)]
    T3 = [idx(1) idx_old idx(k)];
    [E,T] = op_insere_tri(E,T,T3);
    
end

end

