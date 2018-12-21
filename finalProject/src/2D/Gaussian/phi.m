function result = phi( x,y,r )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
result = exp(-pdist2(x,y).^2 / r^2);

end

