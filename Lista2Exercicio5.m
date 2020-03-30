% Lista 2 Exercício 5

clear, close, clc;

% Declaração de Variáveis 
W = randn(1,3);
Ydesejado = [ones(1,500) -ones(1,500)];

% Cria valores randômicos para as Classes 1 e 2
classe1 = randn(2,500);
classe2 = randn(2,500) + 4;

% Plota valores para a Classe 1
plot(classe1(1,:),classe1(2,:),'o');
grid on; hold on;

% Plota valores para a Classe 2
plot(classe2(1,:),classe2(2,:),'sr');
 
%  Valores para x
x = [classe1 classe2; ones(1,1000)];

for k = 1:length(x)
    e(k) = Ydesejado(k) - W*x(:,k);
    W = W + (1/k)*(x(:,k)*e(k))';
end

% Reta 
b = -4:10;
a = -W(2)*b/W(1) - W(3)/W(1);
plot(a,b,'--b','LineWidth',1)
 
% Reta discriminante Bayes
x2 = -4:10;
x1 = 5 - x2;
plot(x1, x2, 'k','LineWidth',1)
title('Minimização do erro quadratico Vs Classificador de Bayes');
legend('Classe 1','Classe 2','MEQ Estocástico','Bayes')

% Plota os valores de W na tela
disp(W);
