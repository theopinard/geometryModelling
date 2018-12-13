clear all
close all
clc

N = 50;

[ P1,P2,P3 ] = create_points( N );

Pa = P2;


idx1 = jarvis2D(Pa);

idx2 = graham2D( Pa );

idx3 = incremental( Pa );

idx4 = quickhull( Pa );

idx5 = convhull(Pa);

figure;
hold on 
plot(Pa(:,1),Pa(:,2),'ko');

for i = 1:size(idx1,2)
    plot(Pa(idx1,1),Pa(idx1,2),'-r');
end
for i = 1:size(idx2,2)
    plot(Pa(idx2,1),Pa(idx2,2),'-r');
end
for i = 1:size(idx3,2)
    plot(Pa(idx3,1),Pa(idx3,2),'-r');
end
for i = 1:size(idx4,2)
    plot(Pa(idx4,1),Pa(idx4,2),'-r');
end
for i = 1:size(idx5,2)
    plot(Pa(idx5,1),Pa(idx5,2),'-r');
end
xlabel('x')
ylabel('y')
legend('points', 'Jarvis', 'Graham' , 'Incremental', 'Quickhull', 'Convhull','location', 'NorthWest')

for k=1:length(Pa);
    text(Pa(k,1), Pa(k,2),['  ' num2str(k)]);
end

%% speed comparison

N = [10 20 50 70 100 200 500 1000];
a = zeros(size(N,2),5);
for i = 1:size(N,2);
    [ P1,P2,P3 ] = create_points(N(i));
    [ a(i,:) ] = speed_comparison( P3 );
end
colours = ['-*m';'-^c';'-+r';'-*g';'-+b'];


figure;
hold on
for i = 1:size(a,2);
    
    plot(N,log(a(:,i)),colours(i,:))
end
xlabel('N')
ylabel('log of comutacional time with t in [s]')
legend('Jarvis', 'Graham' , 'Incremental', 'Quickhull', 'Convhull','location', 'NorthWest')
% %for P1
% title('Time vs number of point for random point in a square [-1 1]x[-1 1]')
% %for P2
% title('Time vs number of point for random point in the unit disc')
%for P3
title('Time vs number of point for random point in the unit circle')


