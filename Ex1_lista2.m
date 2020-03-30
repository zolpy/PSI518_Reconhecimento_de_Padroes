clear all
close all
clc

w1 = randn(2,500);

w2 = 5 + randn(2,500);

plot(w1(1,:),w1(2,:),'s','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g'); 
hold on;
plot(w2(1,:),w2(2,:),'s','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','y');

x1 = -2.5:7.5;
x2 = -x1 + 5;

plot(x1,x2,'--o','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','b'); 

