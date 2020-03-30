clc, close all, clear all;
% syms x1 x2
% x = [x1 x2]
% x = sym('x',[2 1]) % Duas linhas 1 coluna

x = sym('x',[1 2]) % Uma linha 2 colunas
Mi1=[0 0];
Mi2=[1 1];


%% p( x??_1 )

sub1= (x-Mi1)
t = sub1' %Transposta
I=eye(2) %Matriz identidade


sub2= x-Mi1
Sub2Iendt = sub2*I

tVsSub2 = t*Sub2Iendt



% Sub2VsIdent = sub2'

% TransVzIdent = (Sub2VsIdent*sub1)
% t*TransVzIdent


