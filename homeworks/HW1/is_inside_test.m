N = 4;

figure;
grid
axis([-1 1 -1 1]);
P1 = zeros(1,2);
hold on

[x y] = ginput(1);
plot(x,y,'ro');
P1(1,:) = [x y];

Poly = zeros(N,2);
hold on
for i=1:N
    [x y] = ginput(1);
    plot(x,y,'ko');
    Poly(i,:) = [x y];
end

is_inside(P1,Poly)
