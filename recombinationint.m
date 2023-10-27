function [newchromo1, newchromo2] = recombinationint(chromo1, chromo2)
    if nargin < 1
        chromo1 = cromoint(8);
    end
    if nargin < 2
        chromo2 = cromoint(8); % По умолчанию, если S не задан.
    end

assert(length(chromo1) == length(chromo2))

length_chromo = length(chromo1);
if(length_chromo == 1)
cutt = randi(length_chromo);
else
cutt = randi(length_chromo-1);
end
newchromo1 = cat(2,chromo1(1:cutt),chromo2(cutt+1:end));
newchromo2 = cat(2,chromo2(1:cutt),chromo1(cutt+1:end));
end