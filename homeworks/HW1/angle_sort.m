N = 4;

figure;
grid
axis([-1 1 -1 1]);
P = zeros(N,2);
hold on
for i=1:N
    [x y] = ginput(1);
    plot(x,y,'ko');
    P(i,:) = [x y];
end

theta = zeros(1,N);

for i=1:N
    theta(i) = pseudo_angle(P(i,:));
end

[~,idx] = sort(theta);


for i=1:N
    j = idx(i);
    plot(P(j,1),P(j,2),'rx');
    drawnow;
    pause;
end


hold off