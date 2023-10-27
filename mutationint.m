function newchromo = mutationint(chromo, max)
    if nargin < 1
        chromo = cromoint(8);
    end
    if nargin < 2
        max = 10; % По умолчанию, если S не задан.
    end

lengh = length(chromo);
if(length(chromo) == 1)
A=1;
else A=randi(lengh, 1); end
chromo(A)=max;
newchromo=chromo;
end

