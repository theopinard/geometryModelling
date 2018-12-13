function [ V,E,T ] = Convex_hull( P )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[~,I] = sort(P(:,3));
V = zeros(0,3); 
E{1} = [];
T = zeros(0,3);

a = I(1);
b = I(2);
c = I(3);
d = I(4);

T1 =  triangle_order( a,b,c,d, P);

T2 =  triangle_order( a,b,d,c, P);

T3 =  triangle_order( a,c,d,b, P);

T4 =  triangle_order( b,c,d,a, P);



[V,E] = op_insere_vtc(V,E,P);

T_ini = [T1;T2;T3;T4];
    
[E,T] = op_insere_tri(E,T,T_ini);

for i = 5:size(P,1)
    
    d = I(i);
    record = zeros(3 * size(T,1),2);
    v= 1;

    for k = 1:size(T)
        
        T_in = T(k,:);
        T_in = sort(T_in);
        if test_orientied( T(k,:),d ,P) > 0;
            %delete old surface
            a = T_in(1);
            b = T_in(2);
            c = T_in(3);
            
            ind_T = find_T( a,b,c,T);
            [E,T] = op_remove_tri (E ,T , ind_T );
            %delete surface if it adgacente to an other alredy added
            %add surface otherwise
            if sum(ismember(record, [a b],'rows')) ==0;
                T1 =  triangle_order( a,b,d,c, P);
                [E,T] = op_insere_tri(E,T,T1);
            else
                ind_T = find_T( a,b,d,T);
                [E,T] = op_remove_tri (E ,T , ind_T );
            end
            
            if sum(ismember(record, [b c],'rows')) ==0;
                T1 =  triangle_order(b,c,d,a, P);
                [E,T] = op_insere_tri(E,T,T1);
            else
                ind_T = find_T( b,c,d,T);
                [E,T] = op_remove_tri (E ,T , ind_T );
            end
            
            if sum(ismember(record, [a c],'rows')) ==0;
                T1 =  triangle_order(a,c,d,b, P);
                [E,T] = op_insere_tri(E,T,T1);
            else
                ind_T = find_T( a,c,d,T);
                [E,T] = op_remove_tri (E ,T , ind_T );
            end
            
            % add the points to the 
            record(v:v+2,:) = [a,b;a,c;b,c];
            v = v + 3;  
        end    
             
    end
    
end
[V,E,T] = op_limpa_lixo(V,E,T);

end

