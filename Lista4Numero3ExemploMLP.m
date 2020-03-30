% RBF
clc, close all; clear ;
X = [ 1.000  0.500 -0.500 -1.000 -0.500  0.500; ...
      0.000 -0.866 -0.866  0.000  0.866  0.866];
t = [-1 0 1 -1 0 1];
P = 2; for i = 1:6, for j = 1:6, Phi(i,j) = exp(-P*norm(X(:,i)- ...
            X(:,j))^2); end; end;
w = inv(Phi)*t'
Y = X; X = zeros(2,10000);
for i = 1:100,
    for j = 1:100,
        X(:,100*(i-1)+j) = [(i-50.5)/50 ; (j-50.5)/50];
    end;
end;
figure; hold on;
for n=1:size(X,2),
    o = exp(-P*sum((Y-repmat(X(:,n),1,6)).^2,1))*w;
    if o < -0.5,
        plot(X(1,n),X(2,n),'m*');
    elseif o < 0.5,
        plot(X(1,n),X(2,n),'k*');
    else
        plot(X(1,n),X(2,n),'r*');
    end;
end;
plot(Y(1,:),Y(2,:),'white*');
title('Classificador RBF');
xlabel('x_{1}'); ylabel('x_{2}');
% MLP
% Parameters
X = Y; rand('state',0); K = 2; Delta = 1e-5; N = size(X,2); E = 6;
eta = 0.02; alpha = 1; mu = 0.65; MaxIter = 400;
L(1).W = rand(6,2)-0.5; L(1).b = rand(6,1)-0.5;
L(2).W = rand(1,6)-0.5; L(2).b = rand(1,1)-0.5;
for k=1:K,
    L(k).vb = zeros(size(L(k).b));
    L(k).vW = zeros(size(L(k).W));
end;
% Batch Error Backpropagation Training
n=1; i=1; fim=0
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
        e = t(n) - L(K).o;
        J(i) = J(i) + (e'*e)/2;
        % Error Backpropagation
        L(K+1).alpha = e; L(K+1).W = eye(length(e));
        for k = fliplr(1:K)
            L(k).M = eye(length(L(k).o)) - diag(L(k).o)^2;
            L(k).alpha = L(k).M*L(k+1).W'*L(k+1).alpha;
            L(k).db = L(k).db + L(k).alpha;
            L(k).dW = L(k).dW + kron(L(k).x',L(k).alpha);
        end;
        n = n+1; if n>N, n=1; end;
    end;
    % Updates
    for k = 1:K,
        L(k).vb = eta*L(k).db + mu*L(k).vb;
        L(k).b = L(k).b + L(k).vb;
        L(k).vW = eta*L(k).dW + mu*L(k).vW;
        L(k).W = L(k).W + L(k).vW;
    end;
    J(i) = J(i)/E;
    if rem(i,100)==0,
        EMQ = J(i)
    end;
    % Stop criterion
    if (i>1),
        if (abs(J(i)-J(i-1))/J(i) < Delta)|(i>MaxIter),
            fim = 1;
        end;
    end;
    if not(fim)
        i = i+1; if n>N, n=1; end; eta = eta*alpha;
    end;
end;
% [D] Test
X = zeros(2,10000);
for i = 1:100,
    for j = 1:100,
        X(:,100*(i-1)+j) = [(i-50.5)/50 ; (j-50.5)/50];
    end;
end;
figure; hold on;
for n = 1:size(X,2),
    L(1).x = X(:,n);
    for k = 1:K,
        L(k).u = L(k).W*L(k).x + L(k).b;
        L(k).o = tanh(L(k).u);
        L(k+1).x = L(k).o;
    end;
    if L(K).o < -0.5,
        plot(X(1,n),X(2,n),'m*');
    elseif L(K).o < 0.5,
        plot(X(1,n),X(2,n),'k*');
    else
        plot(X(1,n),X(2,n),'r*');
    end;
end;
plot(Y(1,:),Y(2,:),'white*');
title('Classificador MLP');
xlabel('x_{1}'); ylabel('x_{2}');