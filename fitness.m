% ������Ⱥ������Ӧ�ȣ��Բ�ͬ���Ż�Ŀ�꣬�޸�����ĺ���
% population_size: ��Ⱥ��С
% chromosome_size: Ⱦɫ�峤��

function fitness(population_size, chromosome_size)
global fitness_value;
global population;

%global P12;
%global P15;
%global P51;
%global P54;
%global P24;
%global P23;
%global P42;
%global P35;

global lamda;
global T3324;
global Pra;
global Nmax;
global resourceNumbers;
global concurrentDevices;
lamda = 5;
T3324 = 0.255;
Pra = exp(-concurrentDevices/resourceNumbers);
Nmax = 128;
concurrentDevices = 20;
resourceNumbers = 100;

upper_bound = 5000;    % �Ա�������������
lower_bound = 0;    % �Ա�������������

% ������Ⱥ������Ӧ�ȳ�ʼ��Ϊ0
for i=1:population_size
    fitness_value(i) = 0.;    
end

% f(x) = -x-10*sin(5*x)-7*cos(4*x);
for i=1:population_size
    for j=1:chromosome_size
        if population(i,j) == 1
            fitness_value(i) = fitness_value(i)+2^(j-1);    % population[i]Ⱦɫ�崮��ʵ�ʵ��Ա���xi�����ƴ�˳�����෴��
        end        
    end
    fitness_value(i) = lower_bound + fitness_value(i)*(upper_bound-lower_bound)/(2^chromosome_size-1);  % �Ա���xi������תʮ����
    if fitness_value(i)>upper_bound || fitness_value(i)<lower_bound
        disp(fitness_value(i));
    end
    P12 = 1 - exp(-lamda * fitness_value(i));
    P15 = exp(-lamda * fitness_value(i));
    P51 = exp(-lamda * T3324);
    P54 = 1 - P51;
    P24 = power(1-Pra, Nmax);
    P23 = 1 - P24;
    P42 = 1;
    P35 = 1;
    %disp before_fitness_value(i):
    %fitness_value(i)
    %fitness_value(i) = fitness_value(i) + 10*sin(5*fitness_value(i)) + 7*cos(4*fitness_value(i));  % �����Ա���xi����Ӧ�Ⱥ���ֵ
    fitness_value(i) = 1 / ((1 + P51 + P51*P12 + P51*P12*P23) + (2 + P23) * (1 - P51 + P51*P12*P24)/(1 - P24));
    %disp after_fitness_value(i):
    %fitness_value(i)
end

clear i;
clear j;
