clear all;

f = @(x) 600*(300*x(1)+350*x(2)+325*x(3))+300*(200*x(4)+300*x(5)+250*x(6))+650*(150*x(7)+230*x(8)+190*x(9));


sga.cht = 'Chromoint';                        %тип хромосомы
sga.length = 9;                               %длинна хромосомы
sga.qpop = 100;                               %размер популяции
sga.numElite = 10;                            %количество элитных генов
sga.numRecon = 10;                            %количество рекомбинаций
sga.numMut = 10;                              %количество мутаций
sga.limit = [20 30 25];                               %ограничения 
sga.funrand = @limitations; %функция порождения хромосомы
%функция оптимальности
sga.fitfun = @(x) 600*(300*x(1)+350*x(2)+325*x(3))+300*(200*x(4)+300*x(5)+250*x(6))+650*(150*x(7)+230*x(8)+190*x(9));                            
sga.typesel = 'ES';                           %тип селекции 
sga.terminationcond = 2000;                   %макс число поколений
sga.fitgoalpmut = 0.1;                        %значение ошибки
sga.MutOnOff = 1;                             %"1" вкл "0" выкл мутаций
sga.funcriteria = 'max';                      %ищем минимум или максимум
sga.pmut = 1/sga.length;                      %вероятность мутации
sga.precom = 0;                             %вероятность селекции


[bestChromosome, bestFitness,generation] = standardga(sga);

