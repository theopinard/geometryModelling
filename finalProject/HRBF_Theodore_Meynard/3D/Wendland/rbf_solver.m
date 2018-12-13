function [alpha,beta,gamma] = rbf_solver(P,Normal,r,coeff_poly);
%[alpha,centers] = rbf_solver(P,N,shift);
%
N = size(P,1);
n = size(P,2);

A11 = phi(P,P,r);
A12 = DphiDx1( P,P,r );
A13 = DphiDx2( P,P,r );
A14 = DphiDx3( P,P,r );
A21 = A12';
A31 = A13';
A41 = A14';

A22 = D2phiDx12( P,r );
A23 = D2phiDx1Dx2( P,r );
A24 = D2phiDx1Dx3( P,r );
A33 = D2phiDx22( P,r );
A34 = D2phiDx2Dx3( P,r );
A44 = D2phiDx32( P,r );

A32 = A23';
A42 = A24';
A43 = A34';

A = [A11 -A12 -A13 -A14; ...
     A21 -A22 -A23 -A24; ...
     A31 -A32 -A33 -A34; ...
     A41 -A42 -A43 -A44];

Po = P_mat3D(P);
c  = [zeros(N,1); Normal(:)];

Ac = A\c;
gamma = (Po' * (A\Po)) \ (Po'*(Ac));
gamma = coeff_poly * gamma;
Alpha = Ac - A\ (Po*gamma);
Alpha = reshape(Alpha,N,n+1);

alpha = Alpha(:,1);
beta = Alpha(:,2:n+1);


end
