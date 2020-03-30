% Lista 2 Exercício 3

clear all, close all, clc;

% Declaração de Variáveis 
passo = 0.5;
W = randn(3,1);
Y = ones(3,1);
tal = [ones(250,1); -ones(250,1)];
cont = 0;
u = 125;

% Cria valores randômicos para a Classe 1
x1 = randn(1, 250);
x2 = randn(1, 250);
classe1 = [x1; x2];

% Cria valores randômicos para a Classe 2 com ruído
x1 = randn(1, 250) +5;
x2 = randn(1, 250) +5;
classe2 = [x1; x2];

% Plota valores para a Classe 1
plot(classe1(1,:),classe1(2,:),'o')
grid on; hold on;

% Plota valores para a Classe 2
plot(classe2(1,:),classe2(2,:),'sr')
title('Classificador Perceptron Vs Classificador de Bayes')

% Valores para x
x = [classe1 classe2; ones(1,500)];

while u>=0.01
       Y = [];
    tal1 = [];
       u = [];
    for k=1:500
        if (tal(k)*W'*x(:,k))>=0
         cont = cont+1;
         Y(:,cont) = x(:,k);
         tal1(cont,:) = tal(k);
        end
    end
    u2 = -4:10; % u2 = -2.5:7.5;
    u1 = (-W(2)/W(1))*u2 - (W(3)/W(1));
    
    plot(u1,u2,'k--')
    u = length(Y(:,:));
    pause
    if length(Y)==0
        W = W;
    else
    W = W - passo*Y*tal1;
    end
end

