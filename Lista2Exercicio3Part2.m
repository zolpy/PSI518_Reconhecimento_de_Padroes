Y = ones(3,1);
x = [C1 C2; ones(1,500)];
tal = [ones(250,1); -ones(250,1)];
cont = 0;
u = 125;
while u>=0.01;
    Y = [];
    tal1 = [];
    u = [];
    for k=1:500
        if (tal(k)*W'*x(:,k))>=0
         cont = cont+1;
         Y(:,cont) = x(:,k);
         tal1(cont,:) = tal(k);
        end
    end
    u2 = -2.5:7.5;
    u1 = (-W(2)/W(1))*u2 - (W(3)/W(1));
    
    plot(u1,u2,'k--')
    pause
    u = length(Y(1,:));
    if length(Y)==0
        W = W;
    else
    W = W - passo*Y*tal1;
    end
      
end
