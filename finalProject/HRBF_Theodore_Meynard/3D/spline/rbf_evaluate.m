function F = rbf_evaluate(points_in,P,alpha,beta,gamma,r);
%   Detailed explanation goes here
%
F = phi(points_in,P,r )*alpha -( DphiDx1( points_in,P,r ) *  beta(:,1) + DphiDx2( points_in,P,r ) *  beta(:,2) + DphiDx3( points_in,P,r ) *  beta(:,3)); 
Poly_points_in = P_mat3D(points_in);
Poly_points_in = Poly_points_in(1:size(F,1),:);
F = F + Poly_points_in * gamma;
end


