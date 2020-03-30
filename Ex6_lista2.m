clear all
close all
clc


x1 = randn(1, 250);
x2 = randn(1, 250);

C1 = [x1; x2];

plot(C1(1,:),C1(2,:),'o')


x1 = 5 + randn(1, 250);
x2 = 5 + randn(1, 250);

C2 = [x1; x2]
hold on
plot(C2(1,:),C2(2,:),'r*')

X = [[C1'; C2'] ones(500,1)];
y = [ones(250,1); -ones(250,1)];

w = (pinv(X'*X))*X'*y

x2 = [0:0.5:4.5];

x1 = (-w(2)*x2 - w(3))/w(1);

plot(x1,x2,'k')

xd = [0; 1; 3];

plot(xd(1),xd(2),'og')

if (w'*xd)>0
    c = +1
else
    c = -1
end