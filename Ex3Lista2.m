% Lista 2 Exercício 3

clear all, close all, clc;

passo = 0.5;
W = randn(3,1);
Y = ones(3,1);
tal = [ones(25,1); -ones(25,1)];
cont = 0;
u = 125;

x1 = randn(1, 25);
x2 = randn(1, 25);
classe1 = [x1; x2];

x1 = 5 + randn(1, 25);
x2 = 5 + randn(1, 25);
classe2 = [x1; x2];

plot(classe1(1,:),classe1(2,:),'o')
hold on
plot(classe2(1,:),classe2(2,:),'*r')

x = [classe1 classe2; ones(1,50)];
while u>=0.01;
    Y = [];
    tal1 = [];
    u = [];
    for k=1:50
        if (tal(k)*W'*x(:,k))>=0
         cont = cont+1;
         Y(:,cont) = x(:,k);
         tal1(cont,:) = tal(k);
        end
    end
    u2 = -2.5:7.5;
    u1 = (-W(2)/W(1))*u2 - (W(3)/W(1));
    
    plot(u1,u2,'k--')
    pause
    u = length(Y(1,:));
    if length(Y)==0
        W = W;
    else
    W = W - passo*Y*tal1;
    end
       
end
