function [bestChromosome, bestFitness,generation] = standardga(sga)
% Инициализация начальной популяции
population = InitPopulation(sga.cht, sga.qpop, sga.length, sga.funrand);
% проверка ограничений
% Начальное поколение
generation = 1;


while true
    
    for i=1:length(population)
    assert(sga.funrand(2,population{i}) == 1)
    assert(sga.funrand(3,population{i}) == 1)
    end
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
    [selectionProbabilities, selectedIndices] = selection(population, sga.fitfun, sga.typesel, sga.funcriteria,sga.numElite);
for N=1:sga.numRecon
    if(sga.precom)
        Pr = 1:1:round(sga.precom*1000);
        res_rec = randi(1000, 1); % согласен с zosima про 6 и 7

        rec_index = randi(length(selectionProbabilities), 2);
        while (rec_index(1) == rec_index(2))  %проверяем нет ли повторения индексов
            rec_index = randi(length(selectionProbabilities), 2);
        end

        if(1<=res_rec<=round(sga.precom*1000))
            switch sga.cht
                case 'Chromobin'
                    [rec{1}, rec{2}] = recombinationbin(selectionProbabilities{rec_index(1)}, selectionProbabilities{rec_index(2)}); % Генерация случайной бинарной хромосомы.
                case 'Chromoint'
                    [rec{1}, rec{2}] = recombinationint(selectionProbabilities{rec_index(1)}, selectionProbabilities{rec_index(2)}); %Создаём хромосому в форме последовательности целых чисел
                case 'Chromolist'
                    [rec{1}, rec{2}] = recombinationint(selectionProbabilities{rec_index(1)}, selectionProbabilities{rec_index(2)}); %Создаём хромосому в форме последовательности целых чисел
                otherwise
                    error('Неверный тип хромосомы. Допустимые значения: ''Chromobin'', ''Chromoint'', ''Chromolist''.');
            end
        end
    recpop{2*N-1} = rec{1};
    recpop{2*N}   = rec{2};
    else recpop{N} = []; end
end

for N=1:sga.numMut
    if(sga.pmut)
        Pm = 1:1:round(sga.pmut*1000);
        res_mut = randi(1000, 1); % согласен с zosima про 6 и 7
        if(1<=res_mut <= round(sga.pmut*1000))
            switch sga.cht
                case 'Chromobin'
                    mpop{N} = mutationbin(population{randi(sga.qpop,1)}); % Генерация случайной бинарной хромосомы.
                case 'Chromoint'
                    mpop{N} = mutationint(population{randi(sga.qpop,1)}, sga.limit); %Создаём хромосому в форме последовательности целых чисел
                case 'Chromolist'
                    mpop{N} = mutationlist(population{randi(sga.qpop,1)},randi(sga.limit,1)); %Создаём хромосому в форме последовательности целых чисел
                otherwise
                    error('Неверный тип хромосомы. Допустимые значения: ''Chromobin'', ''Chromoint'', ''Chromolist''.');
            end
        end
    end
end

    
    if(sga.MutOnOff == 0 & sga.precom > 0)
        allpopulation = [population' recpop]';
    elseif(sga.precom == 0 & sga.MutOnOff > 0)
        allpopulation = [population' mpop]';
    elseif(sga.precom > 0 & sga.MutOnOff > 0)
        allpopulation = [population' recpop mpop]';
    else
        allpopulation = population;
    end
    
    for i=1:length(allpopulation)
    deb1(i) = (sga.funrand(2,allpopulation{i}) == 1);
    deb2(i) = (sga.funrand(3,allpopulation{i}) == 1);
    end
    % Формирование нового поколения
    % Вычисление оценки функции оптимальности для новой популяции
    newPopulation = newgeneration(allpopulation, sga.fitfun, sga.funcriteria,sga.qpop);
    
    % Замена текущей популяции новой
    population = newPopulation;
    
    generation = generation + 1;   
end


for i=1:(length(all_fitness))
m(i) = max(all_fitness{i});
end
plot(m);
xlabel("число поколений");
ylabel("значение функции");
end