function new_population = Rang(P, fitfunn)
if nargin < 1
    P = [];
end
if nargin < 2
    fitfunn = @(x) min(x); % По умолчанию, если S не задан.
end
new_population = cell(size(P));

for chromonum=1:1:(size(P))
    chromo = P{chromonum};
    fit(chromonum,1) = fitfunn(chromo);
    fit(chromonum,2) = chromonum;
end

for i = 2:(size(P)) % сортируем
    for j = (size(P)):-1:i
        if (fit(j,1)<fit(j-1,1))
            old_fit1 = fit(j-1,1);
            fit(j-1,1) = fit(j,1);
            fit(j,1) = old_fit1;
            
            old_index = fit(j-1,2);
            fit(j-1,2) = fit(j,2);
            fit(j,2) = old_index;
        end
    end
end

for chromonum=1:1:(size(P))
    new_population{chromonum} = P{fit(chromonum,2)};
end
end