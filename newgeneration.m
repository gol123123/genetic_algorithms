function newGeneration = newgeneration(Pold, fitfun, funcriteria,qpop, elite,ok)
% Формирует новое поколение популяции на основе потомков из Pparents.
% elite - количество лучших хромосом, переходящих в следующее поколение.
if nargin < 1
    for i = 1:10
        Pold{i} = randi(100,1);
    end
end
if nargin < 2
    fitfun = @(x) min(x); % По умолчанию, если S не задан.
end
if nargin < 3
    funcriteria = 1;
end
if nargin < 4
    elite = 0;
end
if nargin < 5
    ok = 0;
end

if(ok)
% Проверяем, используется ли элитное сохранение
if elite > 0
    % Вычисляем значения оптимальности для текущей популяции
    for i=1:1:(size(Pold))
        fitness(i) = fitfun(Pold{i});
    end
    for i=1:1:elite
        if(funcriteria)
            [Max(i),Maxi(i)]=min(fitness);
            fitness(Maxi(i)) = NaN;
        else
            [Max(i),Maxi(i)]=max(fitness);
            fitness(Maxi(i)) = NaN;
        end
    end
    % Выбираем лучшие хромосомы из старой популяции
    for i=1:elite
        eliteChromosomes{i} = Pold{Maxi(i)};
    end
else
    eliteChromosomes = [];
end

% Выбираем случайные хромосомы из Pparents для остальной части нового поколения
numOffspring = length(Pold) - elite;
for i=1:numOffspring
    offspringIndices = randsample(1:length(Pparents), 2, true);
    offspringChromosomes{i} = recombinationint(Pold{Pparents(offspringIndices(1))},Pold{Pparents(offspringIndices(2))});
end
Generation = [eliteChromosomes offspringChromosomes Pold']';
else
Generation = Pold;
end
counter = 0;
% избавляемся от дубликатов
for i=1:(size(Generation))
    for j=(i+1):(size(Generation))
         logic = (Generation{i} == Generation{j});
         if(sum(logic) == length(logic))
             Generation{j} = NaN;
             counter = counter +1;
         end
    end
end

  for i=1:counter
      acc = 0;
      for j=1:(size(Generation)-i)
          if(isnan(Generation{j}))
          acc = 1;
          end
          if(acc)
              Generation{j} = Generation{j+1};
          end
      end
  end
% выщитываем оптимальность
for i=1:1:(size(Generation)-counter)
    fitnessnew(i) = fitfun(Generation{i});
end
% выбираем лучшие хромосомы
for i=1:1:(qpop)
    if(funcriteria == 'max')
        [Max(i),Maxi(i)]= max(fitnessnew);
        newGeneration{i} = Generation{Maxi(i)};
        fitnessnew(Maxi(i)) = NaN;
    else
        [Max(i),Maxi(i)]= min(fitnessnew);
        newGeneration{i} = Generation{Maxi(i)};
        fitnessnew(Maxi(i)) = NaN;
    end
end

newGeneration = newGeneration';
% Объединяем элитные хромосомы и потомков в новое поколение

end
