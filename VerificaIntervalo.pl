%leia um valor N. Este valor ser� a quantidade de valores inteiros X que
% ser�o lidos em seguida. Mostre quantos desses valores X est�o dentro
% do intervalo [10,20] e quantos est�o fora do intervalo, mostrando
% essas informa��es.

verificaIntervalo:- write('Insira o valor de n (n�mero de casos teste) : '),
                    read(N),getX(1,N,0).
%passo base do loop
getX(I,N,Acc) :-  I> N, imprimir(N,Acc), !. % flag de parada da recurs�o
getX(I,N,Acc) :- read(X), R is I+1,
                          verifica(R,N,Acc,X).
verifica(I,N,Acc<X):- X >= 10,X =< 20, Aux is Acc + 1, getX( I,N,Aux).
verifica(I,N,Acc,_x) :- 