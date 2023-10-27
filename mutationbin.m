function newchromo = mutationbin(chromo)
length_chromo = length(chromo);
num_mutating_gene = randi(length_chromo);
if(chromo(num_mutating_gene)) 
     chromo(num_mutating_gene)=0;
else chromo(num_mutating_gene)=1; end
newchromo=chromo;
end