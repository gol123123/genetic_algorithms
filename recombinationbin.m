function [newchromo1, newchromo2] = recombinationbin(chromo1, chromo2)


assert(length(chromo1) == length(chromo2))

length_chromo = length(chromo1);
cutt = randi(length_chromo-1);

newchromo1 = cat(2,chromo1(1:cutt),chromo2(cutt+1:end));
newchromo2 = cat(2,chromo2(1:cutt),chromo1(cutt+1:end));
end