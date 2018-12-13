function [ result ] = is_inside(P1,Poly)
%check if the point P1 is inside the polygone Poly 
%   Detailed explanation goes here
N = length(Poly);
Po = [Poly(N,:); Poly ; Poly(1,:)];
result = 1;
for i = 2:N+1
    u = cross_2D(P1(1,:) - Po(i,:), Po(i-1,:) - Po(i,:)) ...
    * cross_2D(P1(1,:) - Po(i,:), Po(i+1,:) - Po(i,:));
    if u >=0;
        result = 0;
    end
end

end

