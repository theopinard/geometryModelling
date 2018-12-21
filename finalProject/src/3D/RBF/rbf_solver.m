function [alpha,centers] = rbf_solver(P,N,shift);
%[alpha,centers] = rbf_solver(P,N,shift);
%
n = size(P,1);
P_p = P + shift * N;
P_n = P - shift * N; 
centers = [P_n;P;P_p];
b = [-ones(n,1) ; zeros(n,1) ; ones(n,1)];
d = pdist(centers);
D = squareform(d);
alpha = D\b; 

end
