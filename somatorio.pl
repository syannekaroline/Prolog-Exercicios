
somatorio :- S is 0,
                write("Digite um n�mero:"),
		read(X),
		somatorio(X,S).
somatorio(0,S) :- write(S),!.
somatorio(X,S) :- Aux is X + S,
			read(N),
			somatorio(N,Aux).
