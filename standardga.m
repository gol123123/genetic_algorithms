function [bestChromosome, bestFitness,generation] = standardga(sga)
% Инициализация начальной популяции
population = InitPopulation(sga.cht, sga.qpop, sga.length, sga.funrand);

% Начальное поколение
generation = 1;


while true
    % Вычисление начальной оценки функции оптимальности
    for i=1:length(population)
        fitness(i) = sga.fitfun(population{i});
    end
    
    all_fitness{generation} = fitness;
    
    % Выбор лучшей хромосомы в текущем поколении
    if(sga.funcriteria == 'max')
        [bestFitnessInGeneration, bestIndexInGeneration] = max(fitness);
    else
        [bestFitnessInGeneration, bestIndexInGeneration] = min(fitness);
    end
    bestChromosomeInGeneration = population{bestIndexInGeneration};
    
    % Проверка условия завершения оптимизации
    if sga.terminationcond == generation || bestFitnessInGeneration <= sga.fitgoalpmut
        bestChromosome = bestChromosomeInGeneration;
        bestFitness = bestFitnessInGeneration;
        break;
    end
    
    % Ранжирование хромосом
    % rankedPopulation = Rang(population, sga.fitfun);
    
    % Оценка вероятности выбора каждой хромосомы
    [selectionProbabilities, selectedIndices] = selection(population, sga.fitfun, sga.typesel, sga.funcriteria);
    
    if(sga.precom)
        Pr = 1:1:round(sga.precom*1000);
        res_rec = randi(1000, 1); % согласен с zosima про 6 и 7
        if(1<=res_rec<=round(sga.precom*1000))
            switch sga.cht
                case 'Chromobin'
                    [recpop{1}, recpop{2}] = recombinationbin(selectionProbabilities{1}, selectionProbabilities{2}); % Генерация случайной бинарной хромосомы.
                case 'Chromoint'
                    [recpop{1}, recpop{2}] = recombinationint(selectionProbabilities{1}, selectionProbabilities{2}); %Создаём хромосому в форме последовательности целых чисел
                case 'Chromolist'
                    [recpop{1}, recpop{2}] = recombinationint(selectionProbabilities{1}, selectionProbabilities{2}); %Создаём хромосому в форме последовательности целых чисел
                otherwise
                    error('Неверный тип хромосомы. Допустимые значения: ''Chromobin'', ''Chromoint'', ''Chromolist''.');
            end
        else
            recpop{N} = [];
        end
    end
    if(sga.pmut)
        Pm = 1:1:round(sga.pmut*1000);
        res_mut = randi(1000, 1); % согласен с zosima про 6 и 7
        if(1<=res_mut <= round(sga.pmut*1000))
            switch sga.cht
                case 'Chromobin'
                    mpop{1} = mutationbin(population{randi(sga.qpop,1)}); % Генерация случайной бинарной хромосомы.
                case 'Chromoint'
                    mpop{1} = mutationint(population{randi(sga.qpop,1)}, randi(sga.limit,1)); %Создаём хромосому в форме последовательности целых чисел
                case 'Chromolist'
                    mpop{1} = mutationlist(population{randi(sga.qpop,1)},randi(sga.limit,1)); %Создаём хромосому в форме последовательности целых чисел
                otherwise
                    error('Неверный тип хромосомы. Допустимые значения: ''Chromobin'', ''Chromoint'', ''Chromolist''.');
            end
        end
    end
    if(sga.MutOnOff == 0)
        allpopulation = [population' recpop]';
    else
        allpopulation = [population' recpop mpop]';
    end
    % Формирование нового поколения
    % Вычисление оценки функции оптимальности для новой популяции
    newPopulation = newgeneration(allpopulation, sga.fitfun, sga.funcriteria,sga.qpop);
    
    % Замена текущей популяции новой
    population = newPopulation;
    
    generation = generation + 1;
    generation;   
end


for i=1:(length(all_fitness))
m(i) = min(all_fitness{i});
end
plot(m);

end