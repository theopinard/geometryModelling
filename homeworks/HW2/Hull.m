function [ idx_out ] = Hull( P, idx,idx_a,idx_b )
%
%   Detailed explanation goes here

if size(idx,2) == 0;
    idx_out = [idx_a idx_b];
else
    
    q1 = P(idx_a,:);
    q2 = P(idx_b,:);
    v1 = q1 -q2;
    v2 = P(idx,:) - repmat(q1,size(idx,2),1);
    d = abs(cross_2D(v1,v2));

    [~,imax] = max(d);
    idx_c = idx(imax);
    
    v11 = P(idx_c,:) - P(idx_a,:);
    v21 = P(idx,:) - repmat(P(idx_a,:),size(idx,2),1);
    u1 = cross_2D(v11,v21);
    
    v12 = P(idx_b,:) - P(idx_c,:);
    v22 = P(idx,:) - repmat(P(idx_c,:),size(idx,2),1);
    u2 = cross_2D(v12,v22);
    idx_S1 = idx(find(u1<0));
    idx_S2 = idx(find(u2<0));
%     for i = 1:size(idx,2);
%         if u1(i)<0;
%             idx_S1(end+1) = idx(i);
%         end
%         if u2(i)<0;
%             idx_S2(end+1) = idx(i);
%         end
%     end
    idx_out1 = Hull( P, idx_S1,idx_a,idx_c );
    idx_out2 = Hull( P, idx_S2,idx_c,idx_b );
    idx_out = [idx_out1 idx_out2(2:end)];

end

