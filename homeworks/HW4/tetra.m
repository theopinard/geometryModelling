function [ Q,R ] = tetra( i1, i2, i3, i4, i5, i6, i7, i8 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
tetra1 = [i2 i3 i4 i8];
tetra2 = [i1 i2 i4 i8];
tetra3 = [i1 i2 i5 i8];
tetra4 = [i2 i6 i5 i8];
tetra5 = [i2 i6 i8 i7];
tetra6 = [i2 i3 i7 i8];

Q = [tetra1;tetra2;tetra3;tetra4;tetra5;tetra6]; 


R = [Q,Q(:,1),Q(:,3),Q(:,4),Q(:,2),Q(:,4)];

end

