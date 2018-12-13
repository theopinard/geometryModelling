nx = 10;
ny = 12;
ti = linspace(-1,1,ny);
tj = linspace(-1,1,nx);
[X,Y] = meshgrid(ti,tj);
Z = X.^2 + Y.^2;
V = [X(:) Y(:) Z(:)];

ntri = 2*(nx-1)*(ny-1);
T = zeros(ntri,3);
k = 1;

for j=1:ny-1
    for i=1:nx-1
        T(k,:) = [i+(j-1)*nx (i+1)+(j-1)*nx (i+1)+j*nx];
        T(k+1,:) = [(i+1)+j*nx i+j*nx i+(j-1)*nx];
        k = k+2;
    end
end

trimesh(T,V(:,1),V(:,2),V(:,3));
