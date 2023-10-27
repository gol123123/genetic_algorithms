function cromosoma = cromolist(lengh)
x = 1:1:lengh;

a = abs(randn(1,1));
k = (round(rand(1, lengh)*100*a));

for i=1:1:lengh
   cromosoma{i} = [x(i), k(i)];   
end
end