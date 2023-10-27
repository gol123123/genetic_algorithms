function resultChromosome = splice(chromol, chromo2)
    % Проверка на совпадение типов хромосом и их длину


    % Начинаем с пустой результирующей хромосомы
    resultChromosome = [];

    % Проходим по генам в хромосомах и добавляем их в результирующую хромосому
    for i = 1:length(chromol)
        resultChromosome{i} = [chromol{i} chromo2{i}];
    end
    resultChromosome = resultChromosome';
end