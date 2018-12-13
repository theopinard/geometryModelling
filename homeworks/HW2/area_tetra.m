function a = area_tetra(A,B,C,D)

M = [A ; B ; C; D];
a = det([M ones(4,1)]) / 6;
end
