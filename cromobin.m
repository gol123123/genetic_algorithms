function cromosoma = cromobin(lengh, cod)
nz = 2^lengh-1; % ����������� ������������� �������� ��������� ��� �������� �����
Ax=randi(nz); % ������� ��������� ��������� � 10 ��
if cod == 0 % ���� ��� 0 �� ������������� �������� �����������
    z = dec2bin(Ax); %������� �� 10 � 2 ��
          
elseif cod == 1 % ���� ��� 1 �� ������������� ��� ����
    b = dec2bin(Ax); %������� �� 10 � 2 ��
    z = bin2gray(b); %������� �� 2 � ��� ����
end 

%====== ���������� ������� ��������=======
ct = num2str(z); %�������������� � ����� � ������
nct=length(ct); %������� ���������� �������� � ������
if nct~=lengh %���� �������� ������ ��� �������� lengh, �� ����������� �������...
    o=lengh-nct; %���������� ���������� ����������� �����
    m=10^o; %�������� ������������ ���������� �����
    mh=num2str(m); %�������������� ����� ����� � ������ �����
    G1 = [mh(2:(o+1)), ct(1:nct)]; %���������� ������� ����� � ��������� ���������
elseif nct == lengh
    G1 = z;
end
%====== /���������� ������� ��������=======
%====== ������� � �������========

for v=1:1:lengh
    gadost = G1(v);
    w = str2num(gadost);
    cromosoma(v) = [w(1)];
end
%====== /������� � �������========

end

