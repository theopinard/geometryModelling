function [ V,E,T ] = swapedges( V,E,T )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
V(:,3) = V(:,1) .^2 + V(:,2) .^2;

del = 1;

while del == 1;
    del = 0;
    
    segment = [T(:,1:2); T(:,2:3); T(:,[1 3])];
    segment = sortrows(segment);
    segment = unique(segment, 'rows');


    
    for i = 1:size(segment,1)
    
        [ ind_T ] = find_seg( segment(i,:),T );
        if size(ind_T,1) == 2 ; 
        
            T1 = T(ind_T(1),:);
            T2 = T(ind_T(2),:);
            s = segment(i,1);
            q = segment(i,2);
            r = T1(T1 ~= s & T1 ~= q);
            p = T2(T2 ~= s & T2 ~= q);
            d1 = lambdar2(r,s,q,V);
            d2 = lambdar3(q,r,s,p,V);
            if (d1* d2 > 0); 

                [V, E,T] = flip(V, E, T, ind_T(1), ind_T(2));
                del = 1;
            end  
        end
    
    end



end 
V(:,3) = 0* V(:,3);
end

