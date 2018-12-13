function [ idx ] = graham2D( P )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[~, idx] = min(P(:,2));
y = [1 0];
for i = 1:length(P);
    theta(i) = pseudo_angle(P(i,:)- P(idx(1),:),y );
end
[~, I] = sort(theta);
I = [idx I];
% idx(1) 
idx(2) = I(2);
k = 2;
for i = 3:size(I,2)
    while k > 1 & ~is_convex(P(idx(k-1),:),P(idx(k),:),P(I(i),:));
        k = k-1;

    end
    k = k+1;
    idx(k) = I(i);
end

if idx(1) ~= idx(end);
    idx = idx(1:(find(idx==idx(1),1, 'last')));
end


end

