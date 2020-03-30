clc, clear
disp('---------------------------------------------------');
disp('Inicialização W e b');

eta = 0.01;
% ---------------------------------------------------
% Inicialização W e b
rand('state',0)
W1 = round(20*(rand(3,2)-0.5))/10
% fprintf('W1 = %f \n',W1);
% ---------------------------------------------------
b1 = round(20*(rand(3,1)-0.5))/10
% ---------------------------------------------------
W2 = round(20*(rand(2,3)-0.5))/10
% ---------------------------------------------------
b2 = round(20*(rand(2,1)-0.5))/10
% ---------------------------------------------------
W3 = round(20*(rand(2,2)-0.5))/10
% ---------------------------------------------------
b3 = round(20*(rand(2,1)-0.5))/10

pause, clc 
disp('---------------------------------------------------');
disp('Iteracao #1 - Feed-Forward');
% Iteracao #1 - Feed-Forward
x = [-0.5 ; -0.5]
t = [1 ; -1]
u1 = W1*x+b1
o1 = tanh(u1)
u2 = W2*o1+b2
o2 = tanh(u2)
u3 = W3*o2+b3
o3 = tanh(u3)
e = t-o3

pause, clc 
disp('---------------------------------------------------');
disp('Iteracao #1 - Backpropagation');
db3 = (eye(2)-diag(o3)^2)*e
dW3 = kron(o2',db3)
db2 = (eye(2)- diag(o2)^2)*W3'*db3
dW2 = kron(o1',db2)
db1 = (eye(3)- diag(o1)^2)*W2'*db2
dW1 = kron(x',db1)

pause, clc 
disp('---------------------------------------------------');
disp('Iteracao #1 - Atualizacoes');
b1 = b1 + eta*db1
W1 = W1 + eta*dW1
b2 = b2 + eta*db2
W2 = W2 + eta*dW2
b3 = b3 + eta*db3
W3 = W3 + eta*dW3

pause, clc 
disp('---------------------------------------------------');
disp('Iteracao #2 – Feed-Forward');
x = [-0.5 ; 0.5]
t = [-1 ; 1]
u1 = W1*x+b1
o1 = tanh(u1)
u2 = W2*o1+b2
o2 = tanh(u2)
u3 = W3*o2+b3
o3 = tanh(u3)
e = t-o3

pause, clc 
disp('---------------------------------------------------');
disp('Iteracao #2 - Backpropagation');
db3 = (eye(2)-diag(o3)^2)*e
dW3 = kron(o2',db3)
db2 = (eye(2)-diag(o2)^2)*W3'*db3
dW2 = kron(o1',db2)
db1 = (eye(3)- diag(o1)^2)*W2'*db2
dW1 = kron(x',db1)

pause, clc 
disp('---------------------------------------------------');
disp('Iteração #2 - Atualizações');
b3 = b3 + eta*db3
W3 = W3 + eta*dW3
b2 = b2 + eta*db2
W2 = W2 + eta*dW2
b1 = b1 + eta*db1
W1 = W1 + eta*dW1

pause, clc 
disp('---------------------------------------------------');
disp('Iteração #3 – Feed-Forward');
x = [0.5 ; -0.5]
t = [-1 ; 1]
u1 = W1*x+b1
o1 = tanh(u1)
u2 = W2*o1+b2
o2 = tanh(u2)
u3 = W3*o2+b3
o3 = tanh(u3)
e = t-o3

pause, clc 
disp('---------------------------------------------------');
disp('Iteração #3 – Backpropagation');
db3 = (eye(2)-diag(o3)^2)*e
dW3 = kron(o2',db3)
db2 = (eye(2)-diag(o2)^2)*W3'*db3
dW2 = kron(o1',db2)
db1 = (eye(3)-diag(o1)^2)*W2'*db2
dW1 = kron(x',db1)

pause, clc 
disp('---------------------------------------------------');
disp('Iteração #3 – Atualizações');
b1 = b1 + eta*db1
W1 = W1 + eta*dW1
b2 = b2 + eta*db2
W2 = W2 + eta*dW2
b3 = b3 + eta*db3
W3 = W3 + eta*dW3