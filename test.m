% �����Ŵ��㷨�Ĳ���������Ч��
% �趨��⾫��ΪС�����4λ

function test()
elitism = false;             % ѡ��Ӣ����
population_size = 1000;      % ��Ⱥ��С
chromosome_size = 30;       % Ⱦɫ�峤��
generation_size = 500;      % ����������
cross_rate = 0.6;           % �������
mutate_rate = 0.01;         % �������

[best_individual,best_fitness,iterations,x] = genetic_algorithm(population_size, chromosome_size, generation_size, cross_rate, mutate_rate,elitism);

disp ���Ÿ���:
best_individual
disp ������Ӧ��:
best_fitness
disp ���Ÿ����Ӧ�Ա���ֵ:
x
disp �ﵽ���Ž���ĵ�������:
iterations

clear;