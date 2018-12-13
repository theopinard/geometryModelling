n = 32;
r = 4/(n-1); 
phi = @(d,r) exp(-(d/r).^2);
Lphi = @(d,r) 4*r^-2 * exp(-(d/r).^2) .* ((d/r).^2-1);


t = linspace(0,1,n);
[X,Y] = meshgrid(t);
D = squareform(pdist([X(:) Y(:)]));
A = phi(D,r);
L = Lphi(D,r);
b = -1.25 * pi^2 * sin(pi * X) .* cos(pi * Y/2);

b= b(:);


%Boundary condition
flag = zeros(n);
flag(:,1) = 2; flag(:,end) = 2; 
flag(end,:) = 2; flag(1,:) = 1;

flag = flag(:);

b(flag == 2) = 0;
x= X(:);
b(flag ==1) = sin(pi * x(flag==1));
L(flag>0,:) = A(flag>0,:);




%Evaluate u
R = 1e-6 * eye(n^2);
alpha = (L+R)\b; 

U = A*alpha;
U = reshape(U,[n,n]);
figure
surf(X,Y,U);

% exact sol
Ue = sin(pi*X) .*cos(pi* Y/2);
figure;
surf(X,Y,Ue);