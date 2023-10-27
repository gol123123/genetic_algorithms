function population = InitPopulation(cht, S, length, rand)
    % Проверяем наличие аргументов по умолчанию и устанавливаем их, если они не заданы.
    if nargin < 1
        cht = 'Chromoint';
    end
    if nargin < 2
        S = 10; % По умолчанию, если S не задан.
    end
    if nargin < 3
        length = 2; % По умолчанию, если S не задан.
    end
    if nargin < 3
        rand = randi(100,1); % По умолчанию, если S не задан.
    end

population = cell(S, 1); % Создаем ячейковый массив для популяции.
% Генерируем случайные хромосомы и добавляем их в популяцию.
for i = 1:S
switch cht
    case 'Chromobin'
        chromosome = cromobin(length,0); % Генерация случайной бинарной хромосомы.
    case 'Chromoint'
        chromosome = rand(1); %Создаём хромосому в форме последовательности целых чисел
    case 'Chromolist'
        for j=1:length
        chromosome{j} = [j, rand(j)]; %Создаём хромосому в форме последовательности целых чисел
        end                        % Генерация случайной хромосомы в виде списка пар (номер гена, целое значение).
    otherwise
        error('Неверный тип хромосомы. Допустимые значения: ''Chromobin'', ''Chromoint'', ''Chromolist''.');
end
population{i} = chromosome;
end
end




