function [ points_out ] = theta_one_neg( thetra,values,points )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
P_neg = repmat(points(values < 0,:),3,1);
P_pos = points(values > 0,:);

val_neg = repmat(values(values < 0),3,1);
val_pos = values(values > 0,:);


t = val_neg ./ (val_neg - val_pos);

points_out = repmat((ones(3,1)-t),1,3) .* P_neg + repmat(t,1,3) .* P_pos;



end

