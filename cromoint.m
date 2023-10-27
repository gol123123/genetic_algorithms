function cromosoma = cromoint(lengh)
A=abs(randn(1,1));
cromosoma = (round(rand(1, lengh)*100*A)); %Создаём хромосому в форме последовательности целых чисел
end

