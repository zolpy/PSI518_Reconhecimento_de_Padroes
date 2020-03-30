% Lista 2 Exercício 9
clear, close, clc;

% Declaração das varaveis
y = [ones(25,1); -ones(25,1)];

% Cria valores randômicos para a Classes 1 
x1 = randn(1, 25);
x2 = randn(1, 25);
classe1 = [x1; x2];

% Cria valores randômicos para a Classes 2
x1 = randn(1, 25) + 7;
x2 = randn(1, 25) + 7;
classe2 = [x1; x2];

% Plota valores para as Classes 1 e 2
plot(classe1(1,:),classe1(2,:),'o');
grid on; hold on;
plot(classe2(1,:),classe2(2,:),'sr');

% Valores para x
x = [[classe1'; classe2'] ones(50,1)];

% Pseudo-Inversa da Matriz
w = (pinv(x'*x))*x'*y;

% Valores para a reta
x2 = -4:10;
x1 = (-w(2)*x2 - w(3))/w(1);

% Plota a reta
plot(x1,x2,'k');

% Valores de xd
xd = [0; 1; 3];

% Plota 
plot(xd(1),xd(2),'omagenta')
title('classificador MSE (pseudo-inversa)');
legend('Classe 1','Classe 2','Bayes')

if (w'*xd)>0
 c = +1;
else
 c = -1;
end

fprintf('w = [%f %f %f]\n',w);
