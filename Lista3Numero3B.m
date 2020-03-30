pause, clc 
disp('-----------------------------------Lista3_Numero3B');
disp('Inicialização W e b');
eta = 0.01;
rand('state',0)
W1 = round(20*(rand(3,2)-0.5))/10
b1 = round(20*(rand(3,1)-0.5))/10
W2 = round(20*(rand(2,3)-0.5))/10
b2 = round(20*(rand(2,1)-0.5))/10
W3 = round(20*(rand(2,2)-0.5))/10
b3 = round(20*(rand(2,1)-0.5))/10
Deltab3 = zeros(size(b3))
DeltaW3 = zeros(size(W3))
Deltab2 = zeros(size(b2))
DeltaW2 = zeros(size(W2))
Deltab1 = zeros(size(b1))
DeltaW1 = zeros(size(W1))

pause, clc 
disp('-----------------------------------Lista3_Numero3B');
disp('Iteração #1 – Feed-Forward');
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
disp('-----------------------------------Lista3_Numero3B');
disp('Iteração #1 – Backpropagation');
db3 = (eye(2)-diag(o3)^2)*e
dW3 = kron(o2',db3)
db2 = (eye(2)-diag(o2)^2)*W3'*db3
dW2 = kron(o1',db2)
db1 = (eye(3)-diag(o1)^2)*W2'*db2
dW1 = kron(x',db1)
Deltab3 = Deltab3 + db3
DeltaW3 = DeltaW3 + dW3
Deltab2 = Deltab2 + db2
DeltaW2 = DeltaW2 + dW2
Deltab1 = Deltab1 + db1
DeltaW1 = DeltaW1 + dW1

pause, clc 
disp('-----------------------------------Lista3_Numero3B');
disp('Iteração #2 – Feed-Forward'); 
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
disp('-----------------------------------Lista3_Numero3B');
disp('Iteração #2 – Backpropagation'); 
db3 = (eye(2)-diag(o3)^2)*e
dW3 = kron(o2',db3)
db2 = (eye(2)-diag(o2)^2)*W3'*db3
dW2 = kron(o1',db2)
db1 = (eye(3)-diag(o1)^2)*W2'*db2
dW1 = kron(x',db1)
Deltab3 = Deltab3 + db3
DeltaW3 = DeltaW3 + dW3
Deltab2 = Deltab2 + db2
DeltaW2 = DeltaW2 + dW2
Deltab1 = Deltab1 + db1
Deltab1 = Deltab1 + db1

pause, clc 
disp('-----------------------------------Lista3_Numero3B');
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
disp('-----------------------------------Lista3_Numero3B');
disp('Iteração #3 – Backpropagation'); 
db3 = (eye(2)-diag(o3)^2)*e
dW3 = kron(o2',db3)
db2 = (eye(2)-diag(o2)^2)*W3'*db3
dW2 = kron(o1',db2)
db1 = (eye(3)-diag(o1)^2)*W2'*db2
dW1 = kron(x',db1)
Deltab3 = Deltab3 + db3
DeltaW3 = DeltaW3 + dW3
Deltab2 = Deltab2 + db2
DeltaW2 = DeltaW2 + dW2
Deltab1 = Deltab1 + db1
DeltaW1 = DeltaW1 + dW1

pause, clc 
disp('-----------------------------------Lista3_Numero3B');
disp('Iteração #4 – Feed-Forward'); 
x = [0.5 ; 0.5]
t = [1 ; -1]
u1 = W1*x+b1
o1 = tanh(u1)
u2 = W2*o1+b2
o2 = tanh(u2)
u3 = W3*o2+b3
o3 = tanh(u3)
e = t-o3

pause, clc 
disp('-----------------------------------Lista3_Numero3B');
disp('Iteração #4 – Backpropagation'); 
db3 = (eye(2)-diag(o3)^2)*e
dW3 = kron(o2',db3)
db2 = (eye(2)-diag(o2)^2)*W3'*db3
dW2 = kron(o1',db2)
db1 = (eye(3)-diag(o1)^2)*W2'*db2
dW1 = kron(x',db1)
Deltab3 = Deltab3 + db3
DeltaW3 = DeltaW3 + dW3
Deltab2 = Deltab2 + db2
DeltaW2 = DeltaW2 + dW2
Deltab1 = Deltab1 + db1
DeltaW1 = DeltaW1 + dW1

pause, clc 
disp('-----------------------------------Lista3_Numero3B');
disp('Fim da Época - Atualizações'); 
b3 = b3 + eta*Deltab3
W3 = W3 + eta*DeltaW3
b2 = b2 + eta*Deltab2
W2 = W2 + eta*DeltaW2
b1 = b1 + eta*Deltab1
W1 = W1 + eta*DeltaW1