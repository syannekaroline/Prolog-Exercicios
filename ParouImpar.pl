%programa
parOuImpar :- write('Digite um número: (0 - para o programa) '),nl,

                   read(X), check(X),!.
%passo base
check(0) :- !.

check(X) :- mod(X,2) =:= 0,
           write(" Par "),nl,
           parOuImpar,!.
check(_X) :- write(" ímpar "),nl,
           parOuImpar,!.

