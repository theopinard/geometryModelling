function [ rectangle_out,a_out] = divide_rec( rectangle,P,a )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
P1 = rectangle(1,:);
P2 = rectangle(2,:);
P3 = rectangle(3,:);
P4 = rectangle(4,:);

P5 = mean([P1;P2;P3;P4]);

rectangle1 = [P1 ; mean([P1;P2]) ; P5 ; mean([P1;P4])];
rectangle2 = [mean([P1;P2]) ; P2 ; mean([P2;P3]) ; P5];
rectangle3 = [P5 ; mean([P2;P3]) ; P3 ; mean([P3;P4])];
rectangle4 = [mean([P1;P4]) ; P5 ; mean([P3;P4]) ; P4];

rectangle_out(:,:,1) = rectangle1;
rectangle_out(:,:,2) = rectangle2;
rectangle_out(:,:,3) = rectangle3;
rectangle_out(:,:,4) = rectangle4;

a1 = P(:,1) < P5(1,1) & P(:,2) < P5(1,2) & a;
a2 = P(:,1) < P5(1,1) & P(:,2) > P5(1,2) & a;
a3 = P(:,1) > P5(1,1) & P(:,2) > P5(1,2) & a;
a4 = P(:,1) > P5(1,1) & P(:,2) < P5(1,2) & a;

a_out =[a1,a2,a3,a4];
% result1 = P(a1,:);
% result2 = P(a2,:);
% result3 = P(a3,:);
% result4 = P(a4,:);

end

