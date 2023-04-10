partition(Lista, Esquerda, Direita) :-	length(Lista, Length),
									Indice is Length//2,
									%cl�usula que recebe a lista, uma vari�vel auxiliar que vai funcionar como o i de um for, o i que indica at� onde o "for" deve ir e as listas resultantes da divis�o
									partition(Lista,Indice,[],Esquerda,Direita).
partition(T,0,D,D,T) :- !. % passo base
partition([H | T],Indice,Eaux,E, D) :-append(Eaux,[H],EauxTransitoria),
                                      CountAux is Indice - 1,
                                      partition(T,CountAux,EauxTransitoria,E,D).

merge(L1,L2,Lresultante):- merge(L1,L2,[],Lresultante2),reverse(Lresultante2,Lresultante),!.

merge([],[H2|_],[H2|Lresultante],[H2|Lresultante]):- !.%passo base
merge([H1|_],[],Lresultante,[H1|Lresultante]):- !.%passo base
merge([],[],Lresultante,Lresultante):-!.%passo base
merge([H1| T1],[H2|T2],LresultanteAux,Lresultante):-H1 < H2,
												merge(T1,[H2|T2],[H1|LresultanteAux],Lresultante).
merge(L1,[H2|T2],LresultanteAux,Lresultante):- merge(L1,T2,[H2|LresultanteAux],Lresultante).

mergeSort([],[]). % passo base -> reparti��o finalizada - lista vazia
mergeSort([H], [H]).% contem s� um elemento -> n�o precisa de merge

mergeSort(Lista,Resposta) :-  partition(Lista,AuxE,AuxD),
                              mergeSort(AuxE,SortE),
                              mergeSort(AuxD,SortD),
                              merge(SortE,SortD,Resposta),!.

%is_sorted(Lista) :- mergeSort(Lista,ListaOrdenada),
			%	comparaListas(Lista,ListaOrdenada).

comparaListas([],[]).
comparaListas([H1|T1], [H2|T2]) :- H1 =:= H2,
                                   comparaListas(T1,T2).



is_sorted([]).% fato
is_sorted([_]).%fato
is_sorted([H1,H2|T1]) :- H1 =< H2 ,
					is_sorted([H2|T1]),!.
