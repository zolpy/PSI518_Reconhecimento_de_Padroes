% Lista 2 Exercício 14

clear, close, clc;

% Variáveis de entrada 
x1 = randn(1, 25);
x2 = randn(1, 25);
x3 = randn(1, 25) + 3;
x4 = randn(1, 25) + 3;
xd = [0; 1; 5.5];
min=-4;
max=10;
 
% Classe 1 e 2
classe1 = [x1; x2];
classe2 = [x3; x4];

% Plot dos graficos
plot(classe1(1,:),classe1(2,:),'o')
grid on; hold on;
plot(classe2(1,:),classe2(2,:),'sr')

X = [[classe1'; classe2'] ones(50,1)];
y = [ones(25,1); -ones(25,1)];

% Pseudo-Inversa da Matriz
w = (pinv(X'*X))*X'*y;

% Plota dados
x = min:max;
y = (-w(2)*x - w(3))/w(1);
plot(y,x,'--k')
 
% plota xd
plot(xd(1),xd(2),'og')
title('Aproximação estocástica');
legend('Classe 1','Classe 2','MEQ Estocástico','Bayes')
 
if (w'*xd)>0
    c = +1;
else
    c = -1;
end
