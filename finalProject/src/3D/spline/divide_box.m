function [ box_out,a_out] = divide_box( box,P,a )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
P1a = box(1,:);
P2a = box(2,:);
P3a = box(3,:);
P4a = box(4,:);
P1b = box(5,:);
P2b = box(6,:);
P3b = box(7,:);
P4b = box(8,:);

P5a = mean([P1a;P2a;P3a;P4a]);
P5b = mean([P1b;P2b;P3b;P4b]);

P1 = mean([P1a;P1b]);
P2 = mean([P2a;P2b]);
P3 = mean([P3a;P3b]);
P4 = mean([P4a;P4b]);
P5 = mean([P5a;P5b]);

box1 = [P1a ; mean([P1a;P2a]) ; P5a ; mean([P1a;P4a]) ; P1 ; mean([P1;P2]) ; P5 ; mean([P1;P4])];
box2 = [mean([P1a;P2a]) ; P2a ; mean([P2a;P3a]) ; P5a ; mean([P1;P2]) ; P2 ; mean([P2;P3]) ; P5];
box3 = [P5a ; mean([P2a;P3a]) ; P3a ; mean([P3a;P4a]) ; P5 ; mean([P2;P3]) ; P3 ; mean([P3;P4])];
box4 = [mean([P1a;P4a]) ; P5a ; mean([P3a;P4a]) ; P4a ; mean([P1;P4]) ; P5 ; mean([P3;P4]) ; P4];
box5 = [P1 ; mean([P1;P2]) ; P5 ; mean([P1;P4]) ; P1b ; mean([P1b;P2b]) ; P5b ; mean([P1b;P4b])];
box6 = [mean([P1;P2]) ; P2 ; mean([P2;P3]) ; P5 ; mean([P1b;P2b]) ; P2b ; mean([P2b;P3b]) ; P5b];
box7 = [P5 ; mean([P2;P3]) ; P3 ; mean([P3;P4]) ; P5b ; mean([P2b;P3b]) ; P3b ; mean([P3b;P4b])];
box8 = [mean([P1;P4]) ; P5 ; mean([P3;P4]) ; P4 ; mean([P1b;P4b]) ; P5b ; mean([P3b;P4b]) ; P4b];

box_out(:,:,1) = box1;
box_out(:,:,2) = box2;
box_out(:,:,3) = box3;
box_out(:,:,4) = box4;
box_out(:,:,5) = box5;
box_out(:,:,6) = box6;
box_out(:,:,7) = box7;
box_out(:,:,8) = box8;

a1 = P(:,1) < P5(1,1) & P(:,2) < P5(1,2) & P(:,3) < P5(1,3) & a;
a2 = P(:,1) < P5(1,1) & P(:,2) > P5(1,2) & P(:,3) < P5(1,3) & a;
a3 = P(:,1) > P5(1,1) & P(:,2) > P5(1,2) & P(:,3) < P5(1,3) & a;
a4 = P(:,1) > P5(1,1) & P(:,2) < P5(1,2) & P(:,3) < P5(1,3) & a;
a5 = P(:,1) < P5(1,1) & P(:,2) < P5(1,2) & P(:,3) > P5(1,3) & a;
a6 = P(:,1) < P5(1,1) & P(:,2) > P5(1,2) & P(:,3) > P5(1,3) & a;
a7 = P(:,1) > P5(1,1) & P(:,2) > P5(1,2) & P(:,3) > P5(1,3) & a;
a8 = P(:,1) > P5(1,1) & P(:,2) < P5(1,2) & P(:,3) > P5(1,3) & a;

a_out =[a1,a2,a3,a4,a5,a6,a7,a8];

end

