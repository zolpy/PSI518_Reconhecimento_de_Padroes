clc, clear, close;
% Entrada de Dados
X = [-0.5 -0.5  0.5 0.5 ;
     -0.5  0.5 -0.5 0.5];

T = [1 -1 -1  1 ;
    -1  1  1 -1];

% Valores para alguns Parametros 
K = 3;               % Numero de camadas 
Delta = 1e-5;        % Criterio de parada
N = size(X,2);       % Numero de entrada 
E = 4;               % Numero de iterações Feed-Forward por Epoca (substituir 1 por 4)
eta = 0.02;          % Eta recebe 2%
alpha = 1;           % Valor para Alfa

% Camadas, Valores randômicos 
rand('state',0);
L(1).W = round(20*(rand(3,2)-0.5))/10;
L(1).b = round(20*(rand(3,1)-0.5))/10;
L(2).W = round(20*(rand(2,3)-0.5))/10;
L(2).b = round(20*(rand(2,1)-0.5))/10;
L(3).W = round(20*(rand(2,2)-0.5))/10;
L(3).b = round(20*(rand(2,1)-0.5))/10;

% Treinamento de retropropagação de erro em lote

n=1; i=1; fim=0;
while not(fim),
    for k=1:K,
        L(k).db = zeros(size(L(k).b));
        L(k).dW = zeros(size(L(k).W));
    end;
    J(i) = 0;
    for ep=1:E,
        % Feed-Forward
        L(1).x = X(:,n);
        for k = 1:K,
            L(k).u = L(k).W*L(k).x + L(k).b;
            L(k).o = tanh(L(k).u);
            L(k+1).x = L(k).o;
        end;
        e = T(:,n) - L(K).o;
        J(i) = J(i) + (e'*e)/2;
        % Error Backpropagation
        L(K+1).alpha = e; L(K+1).W = eye(length(e));
        for k = fliplr(1:K),
            L(k).M = eye(length(L(k).o)) - diag(L(k).o)^2;
            L(k).alpha = L(k).M*L(k+1).W'*L(k+1).alpha;
            L(k).db = L(k).db + L(k).alpha;
            L(k).dW = L(k).dW + kron(L(k).x',L(k).alpha);
        end;
        n = n+1; if n>N, n=1; end;
    end;
    %  Updates
    for k = 1:K,
        L(k).b = L(k).b + eta*L(k).db;
        L(k).W = L(k).W + eta*L(k).dW;
    end;
    J(i) = J(i)/E;
    % Criterio de Parada (Please Stop)
    if (i>1),
        if (abs(J(i)-J(i-1))/J(i) < Delta)|(i>1000),
            fim = 1;
        end;
    end;
    if not(fim)
        i = i+1; if n>N, n=1; end; eta = eta*alpha;
    end;
end;
% Teste
for n = 1:size(X,2),
    L(1).x = X(:,n);
    for k = 1:K,
        L(k).u = L(k).W*L(k).x + L(k).b;
        L(k).o = tanh(L(k).u);
        L(k+1).x = L(k).o;
    end;
    [X(:,n) L(K).o]
end;

plot(J); 
grid on;
% title('Resultados em modo sequencial');
title('Resultados em modo Batch '); 
ylabel('Amplitude');
xlabel('Épocas');
axis tight;