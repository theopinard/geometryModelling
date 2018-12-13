function [alpha,beta,gamma] = rbf_solver(P,Normal,r,coeff_poly);
%[alpha,centers] = rbf_solver(P,N,shift);
%
N = size(P,1);
n = size(P,2);

A11 = phi(P,P,r);
A12 = DphiDx1( P,P,r );
A13 = DphiDx2( P,P,r );
A21 = A12';
A31 = A13';

A22 = D2phiDx12( P,r );
A23 = D2phiDx1Dx2( P,r );
A32 = A23';
A33 = D2phiDx22( P,r );

A = [A11 -A12 -A13; ...
     A21 -A22 -A23; ...
     A31 -A32 -A33];
Po = P_mat2D(P);

c  = [zeros(N,1); Normal(:,1); Normal(:,2)];


Ac = A\c;
gamma = (Po' * (A\Po)) \ (Po'*(Ac));
gamma = coeff_poly * gamma;
Alpha = Ac - A\ (Po*gamma);

Alpha = reshape(Alpha,N,3);

alpha = Alpha(:,1);
beta = Alpha(:,2:n+1);


end
