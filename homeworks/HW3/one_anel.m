function [ result ] = one_anel(E, T, ind);
%one_anel(E, T, ind)
%   Detailed explanation goes here
star = E{ind};

result = T(star,:);
result = unique(result(:));
result = result(result~=ind);

end

