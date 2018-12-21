function F = rbf_evaluate(points_in,centers,alpha);
%   Detailed explanation goes here
%
F = pdist2(points_in, centers) * alpha;

end

