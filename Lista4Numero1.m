clc, clear, close;
disp('-----------------------------------Lista3_Numero1_Letra(A)');

% conjunto de dados para treino 
xR = [0 0.2 0.4 0.6 0.8]'; 
tR = [-1.04 -0.39 0.09 0.92 1.43]';
XR = [ones(size(xR)) xR xR.^2 xR.^3 xR.^4];

% conjunto de dados para validação 
xV = [0.1 0.3 0.5 0.7 0.9]'; 
tV = [-0.87 -0.07 0.62 1.10 1.72]';
XV = [ones(size(xV)) xV xV.^2 xV.^3 xV.^4];

% Item (a) 
% lambda = [1e-15 1e-14 1e-13 1e-12 1e-11 1e-10 1e-9 1e-8 1e-7 1e-6];
lambda = [1e-10 1e-9 1e-8 1e-7 1e-6 1e-5 1e-4 1e-3 1e-2 1e-1];
E = zeros(length(lambda),2);

for k=1:length(lambda),
w = inv(XR'*XR + lambda(k)*eye(5))*XR'*tR;
E(k,:) = [mean((XR*w-tR).^2) mean((XV*w-tV).^2)];
end;
[log10(lambda)' E]

stem(log10(lambda),E(:,2)); grid on;
xlabel('log_{10}(\lambda)'); ylabel('Erro Médio Quadrático (Validação)');

pause, clc;
disp('-----------------------------------Lista3_Numero1_Letra(B)');
% Item (b): Para Lambda = 0:
lambda = 0;
w = inv(XR'*XR + lambda*eye(5))*XR'*tR
[mean((XR*w-tR).^2) mean((XV*w-tV).^2)]

pause, clc; 
% Item (b): Para Lambda = 1e-3:
lambda = 1e-3;
w = inv(XR'*XR + lambda*eye(5))*XR'*tR
[mean((XR*w-tR).^2) mean((XV*w-tV).^2)]

pause
clc, close;
% Item (c) - Comparações
disp('-----------------------------------Lista3_Numero1_Letra(C)');
a = 0; b = 1; pts = 1000; stp = (b-a)/pts; x = (a:stp:(b-stp))';
X = [ones(size(x)) x x.^2 x.^3 x.^4];

disp('---------------------Para Lambda = 0');
% Item (c): Para Lambda = 0:
lambda = 0;
w = inv(XR'*XR + lambda*eye(5))*XR'*tR
figure; plot(xR,tR,'ko',xV,tV,'k*');
hold on; plot(x,X*w,'b-');

disp('---------------------Para Lambda = 1e-3');
% Item (c): Para Lambda = 1e-3:
lambda = 1e-3;
w = inv(XR'*XR + lambda*eye(5))*XR'*tR
plot(x,X*w,'r-'); grid on;
xlabel('x_{1}'); ylabel('x_{2}');
legend('Lambda = 0','Lambda = 1e-3')