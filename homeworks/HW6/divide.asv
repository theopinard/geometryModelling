function [ rectangle,a ] = divide( P,rectangle_in, num_point)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

a(:,1) = ones(size(P,1),1);
rectangle(:,:,1) = rectangle_in;
ind_rect = find(sum(a) > num_point);
k = 2;


while size(ind_rect,2) >= 1
    for ind = ind_rect;
        [rectangle_out,a_out] = divide_rec( rectangle(:,:,ind),P,a(:,ind));
        [Y_a,I_a] = sort(sum(a_out));
        rectangle(:,:,k:k+3) = rectangle_out;
        a(:,k:k+3) = a_out;

        k = k + 4;
    end
    
    rectangle(:,:,ind_rect) = [];
    a(:,ind_rect) = [];
    k = k - size(ind_rect,2);

    ind_rect = find(sum(a) > num_point);
end

rectangle(:,:,sum(a) == 0) = [];
a(:,sum(a) == 0) = [];


end

