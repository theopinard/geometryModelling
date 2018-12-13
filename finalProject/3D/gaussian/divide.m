function [ box,a ] = divide( P,box_in, num_point)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

a(:,1) = ones(size(P,1),1);
box(:,:,1) = box_in;
ind_rect = find(sum(a) > num_point);
k = 2;


while size(ind_rect,2) >= 1
    for ind = ind_rect;
        [box_out,a_out] = divide_box( box(:,:,ind),P,a(:,ind));
        %[Y_a,I_a] = sort(sum(a_out));
        box(:,:,k:k+7) = box_out;
        a(:,k:k+7) = a_out;

        k = k + 8;
    end
    
    box(:,:,ind_rect) = [];
    a(:,ind_rect) = [];
    k = k - size(ind_rect,2);

    ind_rect = find(sum(a) > num_point);
end

box(:,:,sum(a) == 0) = [];
a(:,sum(a) == 0) = [];
a = boolean(a);

end

