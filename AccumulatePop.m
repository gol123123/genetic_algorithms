function P = AccumulatePop(P, q)
    % Получить количество хромосом в популяции
    numChromosomes = size(P, 1);

    % Определить количество хромосом, которые нужно разрезать
    numToCut = round(numChromosomes / 2);

    for generation = 1:q
        % Случайным образом выбрать хромосомы для разрезания
        chromosomesToCut = randperm(numChromosomes, numToCut);

        % Склеить выбранные хромосомы
        for i = 1:numToCut
            currentChromosome = P(chromosomesToCut(i), :);
            partnerChromosome = P(chromosomesToCut(end - i + 1), :);
            P(chromosomesToCut(i), :) = [currentChromosome(1:end/2), partnerChromosome(end/2+1:end)];
        end

        % Обновить популяцию после склеивания
        P = Mutation(P); % Возможно, вам потребуется функция мутации

        % В этой точке можно добавить другие этапы насыщения, если необходимо
    end
end