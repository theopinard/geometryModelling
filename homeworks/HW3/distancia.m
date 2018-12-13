function [ k ] = distancia( E, T, ind1, ind2 )
%distancia( E, T, ind1, ind2 )
%   Detailed explanation goes here
result = ind1;
old_kernel = ind1;
k = 0;
while ~(ismember(ind2,result))
    new = [];
    for j = result'
        temp = one_anel(E, T, j);
        temp=temp(~ismember(temp,old_kernel));
        new = unique([new;temp]);
    end
    result = new;
    old_kernel = unique([old_kernel;result]);
    k = k+1;
    
end

end

