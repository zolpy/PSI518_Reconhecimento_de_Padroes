% Função plota reta

function plotareta(w, b, intervalo)
load('salva_xp.mat','xp_sep')
load('salva_xp.mat','xp_n_sep')

if (xp_sep)
    x1_sep=[(min(xp_sep)+intervalo(1)):0.1:(max(xp_sep)+intervalo(2))];
    x2_sep=(-w(1)*x1_sep-b(1))/w(2);
    plot(x1_sep, x2_sep)
elseif(xp_n_sep)
    x1_n_sep=[(min(xp_n_sep)+intervalo(1)):0.1:(max(xp_n_sep)+intervalo(2))];
    x2_n_sep=(-w(1)*x1_n_sep-b(1))/w(2);
    plot(x1_n_sep, x2_n_sep)
end




% %     x1 = [intervalo(1) : 0.1 : intervalo(2)];           % Define-se o intervalo de plotagem
% x1=[(min(xp)+intervalo(1)):0.1:(max(xp)+intervalo(2))];
% x2=(-w(1)*x1-b(1))/w(2);
%
%     plot(x1, x2)
% %  legend('Location','southwest'); % legend('boxoff')

end