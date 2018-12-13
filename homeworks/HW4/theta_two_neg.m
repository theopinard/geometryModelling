function [ points_out1,points_out2 ] = theta_two_neg( thetra,values,points )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
P_neg = points(values < 0,:);
P_pos = points(values > 0,:);

val_neg = values(values < 0);
val_pos = values(values > 0);


t1 = val_neg ./ (val_neg - val_pos);

points1 = repmat((ones(2,1)-t1),1,3) .* P_neg + repmat(t1,1,3) .* P_pos;


t2 = flipud(val_neg) ./ (flipud(val_neg) - val_pos);

points2 = repmat((ones(2,1)-t2),1,3) .* flipud(P_neg) + repmat(t2,1,3) .* P_pos;

points_out1 = [points1 ;points2(1,:)];

points_out2 = [points1 ;points2(2,:)];




end

