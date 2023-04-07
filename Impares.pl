%Leia um valor inteiro X ( entre 1 e 1000). em seguida mostre os impares
% de 1 até X, um valor por linha, inclusive o X.
% entrada: 1 valor inteiro qualquer


impares :- read(X), eh_impar(1,X).
% passo base
eh_impar(R,X) :- R > X,!.
eh_impar(X,_) :- write(C),nl, Aux is C + 2, eh_impar(Aux,X).
