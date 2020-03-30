% Lista 2 Exercício 1

clear all, close all, clc;

% Declarando as classes randômico normal
classe1 = randn(2,500);
classe2 = randn(2,500)+5;

% Plotando os dados das classes 1 e 2
plot(classe1(1,:),classe1(2,:),'ob','LineWidth',1); 
grid on; hold on;
plot(classe2(1,:),classe2(2,:),'sblack','LineWidth',1);
title('Separação dos conjuntos de dados de treino e teste')
% xlabel('x')
% ylabel('y')

x1 = -4:10;
x2 = -x1 + 5;
plot(x1,x2,'--','LineWidth',2,'MarkerEdgeColor','black'); 
