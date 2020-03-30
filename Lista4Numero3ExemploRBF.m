% clc, clear , close ;
% % C = [0.5 0.5 -0.5 -0.5 ; -0.5 0.5 -0.5 0.5];
% % t = [-1 1 1 -1];
% C=[1.000 0.500 -0.500 -1.000 -0.500	0.500; 0.000 -0.866	-0.866	0.000 0.866	0.866];
% t = [-1	0 1	-1	0 1];
% randn('state',0);
% E = repmat(C(:,1),1,4) + 0.1*randn(2,4);
% F = repmat(C(:,2),1,4) + 0.1*randn(2,4);
% G = repmat(C(:,3),1,4) + 0.1*randn(2,4);
% H = repmat(C(:,4),1,4) + 0.1*randn(2,4);
% % I = repmat(C(:,5),1,4) + 0.1*randn(2,4);
% % J = repmat(C(:,6),1,4) + 0.1*randn(2,4);
% X = [E F G H]; t = [-1 -1 -1 -1 1 1 1 1 1 1 1 1 -1 -1 -1 -1];
% % X = [E F G H I J]; t = [-1 -1 -1 -1 -1 -1 1 1 1 1 1 1 1 1 1 1 1 1 -1 -1 -1 -1 -1 -1]
% % X = [E F G H I J]; t = [-1 -1 -1 -1 -1 -1 -1 -1 -1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
% % P = 1; 
% 
% P = 1; for i = 1:length(t), for j = 1: length(t), Phi(i,j) = exp(-P*norm(X(:,i)-X(:,j))^2); end; end;
% w = inv(Phi)*t'
% X = zeros(2,10000);
% for i = 1:100,
%     for j = 1:100,
%         X(:,100*(i-1)+j) = [(i-50.5)/50 ; (j-50.5)/50];
%     end;
% end;
% Y = [E F G H I J];
% figure; hold on;
% for n=1:size(X,2),
% o = exp(-P*sum((Y-repmat(X(:,n),1,length(t))).^2,1))*w;
% if o < 0,
% plot(X(1,n),X(2,n),'b.');
% else
% plot(X(1,n),X(2,n),'k.');
% end;
% end;
% plot(Y(1,:),Y(2,:),'r.');
% 
% % plot(w);
% % title('Valores dos pesos sinápticos');
% % grid on

clc, clear , close ;
C=[1.000 0.500 -0.500 -1.000 -0.500	0.500; 
   0.000 -0.866	-0.866	0.000 0.866	0.866];
t = [-1	0 1 -1	0 1];

P = 1; for i = 1:length(t), for j = 1: length(t), Phi(i,j) = exp(-P*norm(C(:,i)-C(:,j))^2); end; end;
w = inv(Phi)*t'
Y =C;
C = zeros(2,10000);
for i = 1:100,
    for j = 1:100,
        C(:,100*(i-1)+j) = [(i-50.5)/50 ; (j-50.5)/50];
    end;
end;

figure; hold on;
for n=1:size(C,2),
o = exp(-P*sum((Y-repmat(C(:,n),1,length(t))).^2,1))*w;
if o < -0.5,
plot(C(1,n),C(2,n),'g*');
elseif o <0.5,
plot(C(1,n),C(2,n),'k*');
else
plot(Y(1,:),Y(2,:),'r*');
end;
end;
plot(Y(1,:),Y(2,:),'go');
xlabel('x_{1}'); ylabel('x_{2}');
% plot(w);
% title('Valores dos pesos sinápticos');
% grid on