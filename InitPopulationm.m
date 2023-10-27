function population = InitPopulationm(rand, S,lengh)
    % Проверяем наличие аргументов по умолчанию и устанавливаем их, если они не заданы.

    
    population = cell(S, 1); % Создаем ячейковый массив для популяции.
    
    % Генерируем случайные хромосомы и добавляем их в популяцию.
    for i = 1:S
        for j=1:1:lengh-1
            ind = randi(S);
            cromosoma{j} = [j, rand(ind)];
        end
        cromosoma{lengh} = [lengh,"*"];
        population{i} = cromosoma;
    end
end




