% Mestrando: Luiz Carlos Brand�o Junior
% Data 2/11/2017
% Pratica 4 - Gera dados gaussianos

clear all;close all;clc;tic;warning off

%% Declara��o das Variaveis

nc   = 2;
npc  = [100 200];
mc   = [6 10;12 7];
varc = [1 1;1 2];

alfa = 1.2;
MaxEpocas = 10;
Tolerancia = 0.001;
w = -1+2*rand(1,2);                 % W recebe valores entre [-1 1]
b = -1+2*rand(1,1);                 % b recebe valores entre [-1 1]
intervalo= [-7 7];    

%% Pesos Randomicos
fprintf("Pesos rand�micos = [%f %f]\n",w(1,1),w(1,2));
fprintf("Bias rand�mico   = [%f]\n\n",b);

%% Chamada das fun��es 
% fun��o geragauss 
[x,c] = geragauss(nc, npc, mc, varc);  

% fun��o mistura 
[xp,cp] = mistura(x,c);   
save('saveXP.mat','xp')
%fun��o treina_perceptron 
[w, b, ErroEpoca ] = treina_perceptron(w(1,:),b(1,:),xp,cp(1,:), alfa, MaxEpocas, Tolerancia); 

%fun��o YPerceptron 
y = YPerceptron(xp,w(1,:),b(1,:));

%% Imprime os valores dos pesos e bias
% imprimindo os Pesos Treinados
fprintf("Pesos treinados = [%f %f]\n",w(1,1),w(1,2));

% imprimindo as Bias Treinadas
fprintf("Bias treinada  = [%f]\n",b);

%% Plotar grafico de dados com as classes linearmente separ�veis
figure(1);
title('Linearmente Separ�vel');
% subplot(3,1,1); 
hold on, grid on
plotadc2d(xp,cp);
% axis([round(min(xp)) round(max(xp)) round(min(cp)) round(max(cp))])
xlabel ('X1'); 
ylabel ('X2'); 
title ('Dados originais');
hold off

figure(2);
% subplot(3,1,2); 
hold on, grid on
plotadc2d(xp,y);
axis([3 14 3 15])
xlabel ('X1'); 
ylabel ('X2'); 
title ('Dados reclassificados');
plotareta(w, b, intervalo)
hold off

%Plota SEQ Somat�rio do Erro Quadr�tico

figure(3);
% subplot(3,1,3); 
plot(ErroEpoca);
xlabel ('�poca');
ylabel ('SEQ');
title ('Erro quadr�tico de treinamento');