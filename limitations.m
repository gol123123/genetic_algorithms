
function out = limitations(num,x)
if nargin < 1
        num = 1;
end
if nargin < 2
        x = [];
end

limit = [20 30 25];
product = [100 200 150; 300 280 230; 120 250 190]; %Матрица продукции с загона
minprod = [2000 2500 3500]; %Минимальная продукция

if(num == 1)
%Ограниечение по вместимости
for i=1:length(limit)
out(3*i-2)=randi(limit(i)+1,1)-1;
if(out(3*i-2) == limit(i)) out(3*i-1) = 0;
else out(3*i-1)=randi([limit(i) - out(3*i-2)],1)-1; end
out(3*i)=limit(i)-out(3*i-2)-out(3*i-1);
end
end
%Количество животных не может быть больше вместимости загона
if(num == 2)   
ogr(1) = [x(1)+ x(2)+ x(3)] ==limit(1); 
ogr(2) = [x(4)+ x(5)+ x(6)] ==limit(2);
ogr(3) = [x(7)+ x(8)+ x(9)] ==limit(3); 
if((ogr(1)+ogr(2)+ogr(3)) == length(limit))
    out = 1;
else out = 0; end   
end
if(num == 3)
%Ограничение по минимальному объему проукции
ogr(1) = [x(1)*product(1, 1) + x(2)*product(2, 1)+ x(3)*product(3, 1)] >=minprod(1); %Масса продукции, полученной с загона
ogr(2) = [x(4)*product(1, 2) + x(5)*product(2, 2)+ x(6)*product(3, 2)] >=minprod(2); % ---///----
ogr(3) = [x(7)*product(1, 3) + x(8)*product(2, 3)+ x(9)*product(3, 3)] >=minprod(3); % ---///----
if((ogr(1)+ogr(2)+ogr(3)) == length(limit))
    out = 1;
else out = 0; end
end
end