% Lista 2 Exercício 7

clear, close, clc;

% Declaração das variaveis
y = [ones(250,1); -ones(250,1)];

% Cria valores randômicos para a Classes 1 
x1 = randn(1, 250);
x2 = randn(1, 250);
classe1 = [x1; x2];

% Cria valores randômicos para a Classes 2
x1 = randn(1, 250) + 5;
x2 = randn(1, 250) + 5;
classe2 = [x1; x2];

% Plota valores para a Classe 1
plot(classe1(1,:),classe1(2,:),'o')

% Plota valores para a Classe 2
grid on; hold on;
plot(classe2(1,:),classe2(2,:),'sr')

% Valores para x
x = [[classe1'; classe2'] ones(500,1)];
w = (pinv(x'*x))*x'*y

% Valores para a reta
x2 = -4:10;
x1 = (-w(2)*x2 - w(3))/w(1);

% Plotando a reta com os valores
plot(x1,x2,'k')

% Valores para xd
xd = [0; 1; 3];
plot(xd(1),xd(2),'og')
title('Algoritmo da pseudo inversa');
legend('Classe 1','Classe 2','Bayes')

if (w'*xd)>0
 c = +1;
else
 c = -1;
end
