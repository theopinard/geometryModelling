N = 2; % numero de sites
pts = 5; % numero de pts
m = 2; % grau

phi = @(d,r) exp(-(d/r));

figure;
axis([0 1 0 1]);
hold on
for k=1:N
    P = zeros(pts,2);
    for i=1:pts
        [x,y] = ginput(1);
        plot(x,y,'ko');
        P(i,:) = [x y];
    end
    a = min(P(:,1)); b = max(P(:,1)); 
    site(k).r = 1.2 * (b-a)/2;
    site(k).c = (a+b)/2;
    site(k).p = polyfit(P(:,1),P(:,2),m);
    t = linspace(site(k).c - site(k).r ,site(k).c + site(k).r,20);
    pt = polyval(site(k).p,t);
    plot(t,pt,'b-');
end


n = 100;
x= linspace(0,1,n);
F = zeros(n,1);
for i = 1:n
    t = x(i);
    s= 0;
    for k = 1:N
        
        F(i) = F(i) + polyval(site(k).p,t) * phi((t-site(k).c)^2,site(k).r^2);
        s = s+ phi((t-site(k).c)^2,site(k).r^2);
    end
    F(i) = F(i) / s;
end

plot(x,F,'r--');

hold off