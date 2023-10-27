function newchromo = mutationlist(chromo, max)
lengh = length(chromo);
A=randi(lengh);
chromo{A}(2)=max;
newchromo=chromo;
end