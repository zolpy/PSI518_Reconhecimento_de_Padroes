clear all
close all
clc

x1 = randn(1, 250);
x2 = randn(1, 250);

C1 = [x1; x2];

x1 = 5 + randn(1, 250);
x2 = 5 + randn(1, 250);

C2 = [x1; x2];

plot(C1(1,:),C1(2,:),'o')
hold on
plot(C2(1,:),C2(2,:),'*r')

passo = 0.5;
W = randn(3,1);
Y = ones(3,1);
x = [C1 C2; ones(1,500)];
tal = [ones(250,1); -ones(250,1)];
cont = 0;
u = 125;
while u>=0.01;
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


    
        
