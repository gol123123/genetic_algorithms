
sga.cht = 'Chromoint';                        %тип хромосомы
sga.length = 2;                               %длинна хромосомы
sga.qpop = 100;                               %размер популяции
sga.numElite = 10;                            %количество элитных генов
sga.numRecon = 10;                            %количество рекомбинаций
sga.numMut = 10;                              %количество мутаций
sga.limit = 50;                               %ограничения 
sga.funrand = @(x) (randi(sga.limit(x),1)-1); %функция порождения хромосомы
sga.fitfun = @(x) abs(x(1).^2-x(2).^3);       %функция оптимальности
sga.typesel = 'ES';                           %тип селекции 
sga.terminationcond = 2000;                   %макс число поколений
sga.fitgoalpmut = 0.1;                        %значение ошибки
sga.MutOnOff = 1;                             %"1" вкл "0" выкл мутаций
sga.funcriteria = 'min';                      %ищем минимум или максимум
sga.pmut = 1/sga.length;                      %вероятность мутации
sga.precom = 0.9;                             %вероятность селекции


[bestChromosome, bestFitness,generation] = standardga(sga);


