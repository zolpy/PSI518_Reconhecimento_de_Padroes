% Lista 2 Exercício 10
clear, close, clc;

% Declaração das varaveis 
w1 = randn(2,500);
w2 = randn(2,500)+3;
 
% Plota valores para as Classes 1 e 2
plot(w1(1,:),w1(2,:),'o','LineWidth',1);  %plot(w1(1,:),w1(2,:),'o','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b'); 
grid on; hold on;
plot(w2(1,:),w2(2,:),'s','LineWidth',1); %plot(w2(1,:),w2(2,:),'s','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r');

% Valores para a reta
x1 = -4: 10;
x2 = -x1 + 3;
 
plot(x1,x2,'--magenta','LineWidth',1,'MarkerEdgeColor','k', 'MarkerFaceColor','b'); 
title('Conjunto de dados de treino e teste');
legend('Classe 1','Classe 2','Reta')
