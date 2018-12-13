function  t = pseudo_angle( x,y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if x == 0 | y == 0;
    t = 3;
else
    
    t = (1 - x * y' / (norm(x) * norm(y)));
end

end
