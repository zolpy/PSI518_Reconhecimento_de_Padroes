clear all
close all
clc

x1 = randn(1, 250);
x2 = randn(1, 250);

C1 = [x1; x2];

x1 = 3 + randn(1, 250);
x2 = 3 + randn(1, 250);

C2 = [x1; x2];

plot(C1(1,:),C1(2,:),'o')
hold on
plot(C2(1,:),C2(2,:),'*r')

mu0 = mean(C1(2:500))';
mu1 = mean(C2(2:500))';

cov0 = cov(C1(2: 500));
cov1 = cov(C2(2: 500));

n0 = length(C1);
n1 = length(C2);

w = (n0*cov0 + n1*cov1)\(mu1-mu0);
w = [-w'*(mu0 + mu1)/2 + 0.5 * log(n1/n0); w];
