%programa
parOuImpar :- write('Digite um n�mero: (0 - para o programa) '),nl,

                   read(X), check(X),!.
%passo base
check(0) :- !.

check(X) :- mod(X,2) =:= 0,
           write(" Par "),nl,
           parOuImpar,!.
check(_X) :- write(" �mpar "),nl,
           parOuImpar,!.

