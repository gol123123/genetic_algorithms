function maid_sons = recombinationintm(cromolist, perents, sons)

length = size(cromolist);
assert(length(1) >= perents)
maid_sons = cell(sons,1);
%====== Создание детей=======
for deti=1:1:sons
    mama = cromolist{randi(perents)};
    papa = cromolist{randi(perents)};
    maid_sons{deti} = recombinationint(mama, papa);
end
%====== /Создание детей=======
end