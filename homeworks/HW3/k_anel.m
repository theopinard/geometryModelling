function [ result ] = k_anel(E, T, ind,k);
%k_anel(E, T, ind,k)
%   Detailed explanation goes here
result = ind;
old_kernel = ind;
for i=1:k
    new = [];
    for j = result'
        temp = one_anel(E, T, j);
        temp=temp(~ismember(temp,old_kernel));
        new = unique([new;temp]);
    end
    result = new;
    old_kernel = unique([old_kernel;result]);
    
    
end

end

