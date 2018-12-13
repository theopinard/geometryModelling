function result = phi( x,y,r )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

t = pdist2(x,y)/r;
result = (1-t).^4 .* (4*t+1);
result(t > 1 ) = 0;

end

