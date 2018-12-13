N = 3;

figure;
grid
axis([-1 1 -1 1]);
P1 = zeros(1,2);
hold on

[x y] = ginput(1);
plot(x,y,'ro');
P1(1,:) = [x y];

Tri = zeros(N,2);
hold on
for i=1:N
    [x y] = ginput(1);
    plot(x,y,'ko');
    Tri(i,:) = [x y];
end

lambda = barycentric_coeff(P1,Tri)
