function cutChromosome = cut(chromo)
    % Получить длину хромосомы
    chromosomeLength = length(chromo);

    % Выбрать случайную позицию разреза
    cutPosition = randi(chromosomeLength - 1) + 1;

    % Разрезать хромосому в выбранной позиции
    part1 = chromo(1:cutPosition);
    part2 = chromo(cutPosition+1:end);

    % Вернуть две части хромосомы после разреза
    cutChromosome = {part1, part2};
end