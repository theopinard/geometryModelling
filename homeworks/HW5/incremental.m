function [ idx ] = incremental( P )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[~,I] = sort(P(:,1));
idx = [I(1) I(2) I(1)];
for l = 3:size(I,1);
    k = 1;
    while area(P(idx(k),:),P(idx(k+1),:),P(I(l),:)) > 0;
        k = k+1;
    end
    i = k;
    while k +1 <= length(idx) & area(P(idx(k),:),P(idx(k+1),:),P(I(l),:)) < 0 ;
        k = k+1;
    end
    j = k;
    idx = [idx(1:i) I(l) idx(j:end)];
end

end

