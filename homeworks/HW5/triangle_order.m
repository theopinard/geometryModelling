function [ T_out ] = triangle_order( a,b,c,d ,P)
%triangle_order( a,b,c,d )
%   Detailed explanation goes here
S = cross(P(b,:)-P(a,:),P(c,:)-P(a,:));
    if dot(S,P(d,:)-P(a,:)) > 0;
        T_out = [b a c];
    else
        T_out = [a b c];
    end
    
       
end

