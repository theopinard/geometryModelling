function [ idx ] = jarvis2D( P )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[trash , idx] = min(P(:,2));
y = [1 0];
for j = 1:size(P,1);
    
    for i = 1:length(P)
        theta(i) = pseudo_angle(P(i,:)- P(idx(end),:),y );
    end
    [trash,idx(end+1)] = min(theta);
    y = P(idx(end),:) - P(idx(end - 1),:);
    if idx(end) == idx(1);
        return
        
    end
    
end


end

