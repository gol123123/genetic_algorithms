function new_po = recombinationbinm(cromolist, perents, sons)

length = size(cromolist);
assert(length(1) >= perents)

maid_sons = cell(sons,1);

%====== �������� �����=======
for deti=1:1:sons
    mama = cromolist{randi(perents)};
    papa = cromolist{randi(perents)};
    maid_sons{deti} = recombinationbin(mama, papa);
end
%====== /�������� �����=======
end

