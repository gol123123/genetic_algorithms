function newchromo = mutationint(chromo, max)
    if nargin < 1
        chromo = cromoint(8);
    end
    if nargin < 2
        max = 10; % По умолчанию, если S не задан.
    end
    
num = randi(length(max),1);
lengh = length(chromo);

if(num == 1)
    out(3*num-2)=randi(max(num)+1,1)-1;
    if(out(3*num-2) == max(num)) out(3*num-1) = 0;
    else out(3*num-1)=randi([max(num) - out(3*num-2)],1)-1; end
    out(3*num)=max(num)-out(3*num-2)-out(3*num-1);
    for i=1:3
        chromo(i)=out(i);
    end
    newchromo=chromo;
end
if(num == 2)
    out(3*num-2)=randi(max(num)+1,1)-1;
    if(out(3*num-2) == max(num)) out(3*num-1) = 0;
    else out(3*num-1)=randi([max(num) - out(3*num-2)],1)-1; end
    out(3*num)=max(num)-out(3*num-2)-out(3*num-1);
    for i=1:3
        chromo(3+i)=out(3+i);
    end
    newchromo=chromo;
end
if(num == 3)
    out(3*num-2)=randi(max(num)+1,1)-1;
    if(out(3*num-2) == max(num)) out(3*num-1) = 0;
    else out(3*num-1)=randi([max(num) - out(3*num-2)],1)-1; end
    out(3*num)=max(num)-out(3*num-2)-out(3*num-1);
    for i=1:3
        chromo(6+i)=out(6+i);
    end
    newchromo=chromo;
end
end

