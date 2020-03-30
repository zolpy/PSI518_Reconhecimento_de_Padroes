clc, clear all, close all;

% Variaveis de entrada
y1 = 0; y2 = 0;
erro1=0; erro2=0;

% Gerando dados de classificação distribuição normal
c1 = randn(2,500);       % Classe C1
c2 = randn(2,500)+1;     % Classe C2

%Plotando dados
plot(c1(1,:),c1(2,:),'b+')
hold on
plot(c2(1,:),c2(2,:),'g*')

%Reta de separação dos dados
x1 = -5:5;
x2 = -x1 + 1;

%Plotando dados com reta de separação
plot(x1,x2,'b')
ylabel('Y')
xlabel('X')
title('Distribuição de Classes com Superfície de Separação')
axis([-4 5 -4 5])


for k=1:500
	 f(k) = c1(1,k)+c1(2,k)-1;
 if f(k)<=0
	 y1 = y1+1;
 else
 	erro1 = erro1 +1;
 end
	 f(k) = c2(1,k)+c2(2,k)-1;
 if f(k)>0
 	y2 = y2+1;
 else
	 erro2 = erro2 +1;
 end
end
	fprintf ('Erro 1: %.2f\n', erro1)
	fprintf ('Erro 2: %.2f\n', erro2)
    
    EPT = ((erro1+erro2)/1000)*100;
    fprintf ('Erro Percentual Total: %.2f\n', EPT)
    desempenho = [100*y1/500 100*y2/500];
    fprintf ('Desempenho: [%.2f %.2f]\n', desempenho);

