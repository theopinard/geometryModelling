function [ result ] = test_orientied( T ,d ,P)
%triangle_order( a,b,c,d )
%   Detailed explanation goes here
a = T(1);
b = T(2);
c = T(3);
if [a b c] == [0 0 0];
    result = 0;
else
    S = cross(P(b,:)-P(a,:),P(c,:)-P(a,:));
    result = dot(S,P(d,:)-P(a,:));
end

end
