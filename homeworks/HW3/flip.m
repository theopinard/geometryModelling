function [V, E,T] = flip(V, E, T, indt1, indt2)
%flip(V, E, T, indt1, indt2 )
%   Detailed explanation goes here
if sao_adjacentes( T,indt1,indt2 )
    T1 = T(indt1,:);
    T2 = T(indt2,:);
    temp = intersect(T1,T2);
    a1 = T1(T1 ~= temp(1) & T1 ~= temp(2));
    a2 = T2(T2 ~= temp(1) & T2 ~= temp(2));
    T1_out = [temp(1),a2,a1];
    T2_out = [temp(2),a1,a2];
    
    [E,T] = op_remove_tri(E,T,indt1);
    [E,T] = op_remove_tri(E,T,indt2);
    
    [E,T] = op_insere_tri(E,T,T1_out);
    [E,T] = op_insere_tri(E,T,T2_out);
    
    [V, E,T] = op_limpa_lixo(V,E,T);
end

end

