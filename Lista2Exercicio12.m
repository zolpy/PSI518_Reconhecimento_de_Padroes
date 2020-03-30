% Lista 2 Exercício 12

% Variáveis de entrada 
W = randn(1,3);
Ydesejado = [ones(1,500) -ones(1,500)];
min=-4;
max=10;

% Classes randômicas distribuição normal
classe1 = randn(2,500);
classe2 = randn(2,500) + 3;

% Plotar dados 
grid on; hold on;
plot(classe1(1,:),classe1(2,:),'o');
plot(classe2(1,:),classe2(2,:),'sr');

% Entrada x
x = [classe1 classe2; ones(1,1000)];

 
for k = 1:length(x)
    e(k) = Ydesejado(k) - W*x(:,k);
    W = W + (1/k)*(x(:,k)*e(k))';
end

% Plotar gráfico 
b = min:max;
a = -W(2)*b/W(1) - W(3)/W(1);
plot(a,b,'--b')
 
% Reta discriminante Bayes
x2 = min:max;
x1 = 3 - x2;
plot(x1, x2, 'k')
title('Aproximação estocástica');
legend('Classe 1','Classe 2','MEQ Estocástico','Bayes')
