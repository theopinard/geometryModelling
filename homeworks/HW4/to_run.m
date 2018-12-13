clear all
close all
clc

N = 20; % numero de pontos pna direçao x , y e z


%% gerar os pontos na malha 
V = zeros(0,3);
points_grid = zeros(0,3);   
E{1} = [];
T = zeros(0,3);



for i = 1:N
    for j = 1:N
        for k = 1:N
            points_grid(k + N * (j-1) + N^2 * (i-1),:) = [i,j,k]/N; 
        end
    end
end

points_grid;
points_grid = (points_grid -0.5) * 6; 

%% gerar os tetraedros 
Q = [];
R = [];
for i = 1:size(points_grid);
    temp = 1;
    q1 = fix(i/N);
    r1 = mod(i,N);
    if r1 == 0;
        temp = 0;
    else
        q2 = fix(q1/N);
        r2 = mod(q1,N);
        if r2 == N-1;
            temp = 0;
        else
            r3 = mod(q2,N);
            if r3 == N-1;
                temp = 0;
            end
        end
    end
    
    if temp 
        i1 = i;
        i2 = i +1;
        i3 = i + N +1;
        i4 = i + N;
        i5 = i1 + N^2;
        i6 = i2 + N^2;
        i7 = i3 + N^2;
        i8 = i4 + N^2;
        [ Q_t,R_t ] = tetra( i1, i2, i3, i4, i5, i6, i7, i8 );
        Q = [Q ; Q_t];
        R = [R ; R_t];
    end
end

    

figure
hold on
for i = 1:size(Q,1)
    plot3(points_grid(R(i,:),1),points_grid(R(i,:),2),points_grid(R(i,:),3), '-*')
end
for k=1:length(points_grid);
    text(points_grid(k,1),points_grid(k,2),points_grid(k,3),['  ' num2str((k))]);
end


%% gerar a isosurfacia 
result = isosup(points_grid);

for i = 1:size(Q,1)
    thetra = Q(i,:);
    values = result(thetra);
    points = points_grid(thetra,:);
    
    val_p = sum(values > 0);
    if val_p == 2
        [ points_out1,points_out2 ] = theta_two_neg( thetra,values,points );
        [ V,E,T ] = add_new_triangle(V,E,T, points_out1 );
        [ V,E,T ] = add_new_triangle(V,E,T, points_out2 );
    elseif val_p == 1;
        points_out = theta_one_neg( thetra,-values,points );
        [ V,E,T ] = add_new_triangle(V,E,T, points_out );
    elseif val_p == 3; 
        points_out = theta_one_neg( thetra,values,points );
        [ V,E,T ] = add_new_triangle(V,E,T, points_out );
    end 
end

figure;
hold on
trimesh(T,V(:,1),V(:,2),V(:,3),'FaceColor','interp','FaceLighting','phong','EdgeColor','black');


