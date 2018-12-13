N = 2;

figure;
grid
axis([-1 1 -1 1]);
P1 = zeros(N,2);
hold on
for i=1:N
    [x y] = ginput(1);
    plot(x,y,'ko');
    P1(i,:) = [x y];
end

P2 = zeros(N,2);
hold on
for i=1:N
    [x y] = ginput(1);
    plot(x,y,'ro');
    P2(i,:) = [x y];
end

is_crossing(P1,P2)


