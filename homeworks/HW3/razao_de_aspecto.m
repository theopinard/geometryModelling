function [ toplot ] = razao_de_aspecto( V,T )
%razao_de_aspecto( V,T )
%   Detailed explanation goes here
a = V(T(:,1),:) - V(T(:,2),:);
b = V(T(:,1),:) - V(T(:,2),:);
c = V(T(:,1),:) - V(T(:,3),:);

a = sqrt(sum(a.^2, 2));
b = sqrt(sum(b.^2, 2));
c = sqrt(sum(c.^2, 2));

s = (a+b+c) / 2;

area = sqrt( s .* (s-a) .* (s-b) .* (s-c) );

R = 4 * sqrt(3) * area ./ (a.^2 + b.^2 +c.^2);

for i = 1:10
    toplot(i) = sum(i-1<10*R & 10*R <i);
end
toplot = toplot / sum(toplot);

figure
bar(1:10,toplot)

end

