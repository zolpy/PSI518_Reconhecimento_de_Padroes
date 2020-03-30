% Lista 2 Exercício 3

clear all, close all, clc;

% Declaração de Variáveis 
passo = 0.5;
W = randn(3,1);
Y = ones(3,1);
tal = [ones(25,1); -ones(25,1)];
i = 0;
u = 125;

% Cria valores randômicos para a Classe 1
x1 = randn(1, 25);
x2 = randn(1, 25);
classe1 = [x1; x2];

% Cria valores randômicos para a Classe 2
x1 = 5 + randn(1, 25);
x2 = 5 + randn(1, 25);
classe2 = [x1; x2];

% Plota valores para a Classe 1
plot(classe1(1,:),classe1(2,:),'o')
grid on;  hold on;

% Plota valores para a Classe 2
plot(classe2(1,:),classe2(2,:),'sr')
title('50 eventos de cada classe do conjunto de treinamento');

x = [classe1 classe2; ones(1,50)];
while u>=0.01
       Y = [];
    tal1 = [];
       u = [];
    for k=1:50
        if (tal(k)*W'*x(:,k))>=0
         i=i+1;
         Y(:,i) = x(:,k);
         tal1(i,:) = tal(k);
        end
    end
    u2 = -4:10;
    u1 = (-W(2)/W(1))*u2 - (W(3)/W(1));
    plot(u1,u2,'k--')
    pause
    u = length(Y(:,:));
    
    if u~=0
    W = W - passo*Y*tal1
    end
       
end
