clear all, close all, clc;

% Gerando dados de classificação distribuição normal
c1 = randn(2,500);       % Classe C1
c2 = randn(2,500)+1;     % Classe C2

%Plotando dados
plot(c1(1,:),c1(2,:),'b+')
hold on
plot(c2(1,:),c2(2,:),'g*')

%Reta de separação dos dados
x1 = -5:5;
x2 = -x1 + 1;

%Plotando dados com reta de separação
plot(x1,x2,'b')
ylabel('Y')
xlabel('X')
title('Distribuição de Classes com Superfície de Separação')