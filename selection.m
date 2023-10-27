function [selectedPopulation, selectedIndices] = selection(P, fitfun, typesel, funcriteria, parents)
    % Пропорциональный отбор хромосом из популяции Pparents.
    if nargin < 1
        for i = 1:10
        P{i} = randi(100,1);
        end
    end
    if nargin < 2
        fitfun = @(x) min(x); % По умолчанию, если S не задан.
    end
    if nargin < 3
        typesel = 'PS'; % По умолчанию, если S не задан.
    end
    if nargin < 4
        funcriteria = 'min'; % По умолчанию, если S не задан.
    end
    if nargin < 5
        parents = 2; % По умолчанию, если S не задан.
    end
    % Вычисляем значения приспособленности (fitness) для хромосом в популяции
    
    for i=1:1:(length(P))
    fitness(i) = fitfun(P{i});
    end
    if(typesel == 'PS')
    probability = abs(fitness)./sum(abs(fitness));
    selectedIndices = randsample(1:length(P), parents, true, probability);
    end
    
    if(typesel == 'ES')
        if(funcriteria == 'max')
            for i=1:2
              [f(i), selectedIndices(i)] =  max(fitness);
              fitness(selectedIndices(i)) = NaN;
            end
        else
           for i=1:2
              [f(i), selectedIndices(i)] =  min(fitness);
              fitness(selectedIndices(i)) = NaN;
           end 
        end
    end
    % Формируем подпопуляцию на основе выбранных индексов
    selectedPopulation = P(selectedIndices);
end

