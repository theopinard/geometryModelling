function [ idx ] = quickhull( P )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[~, idx_a] = min(P(:,1));
[~, idx_b] = max(P(:,1));

v1 = P(idx_b,:) - P(idx_a,:);
v2 = P - repmat(P(idx_a,:),size(P,1),1);
u = cross_2D(v1,v2);
idx_S1 = find(u<0)';
idx_S2 = find(u>0)';

idx_out1 = Hull(P, idx_S1,idx_a,idx_b);
idx_out2 = Hull(P, idx_S2,idx_b,idx_a);
idx = [idx_out1 idx_out2(2:end)];



end

