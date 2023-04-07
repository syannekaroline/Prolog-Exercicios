
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Somar os elementos de uma lista- a soma é feita depois da recursão -> só um predicado, pois são dois com a mesma aridade
somaLista([], 0). % só dá mach se a lista for vazia
somaLista([H | T], N) :- soma(T, N1), N is N1 + H.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%2. Retorna o tamanho de uma lista
%versão 2
tamanho([], 0).
tamanho([_ | T], N) :- tamanho(T, N1), N is N1 + 1.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%3. verifica se um elemento está na lista
contem(H, [H | _]) :- !. % a primeira retorna true quando o elemento do primeiro termo for a cabeça da lista e pra isso ele vai dividindo a cabeça de 1 em 1 até encontrar o igual
contem(H, [_ | T]) :- contem(H, T).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%4. Encontrar o maior valor
maior([X | T], R) :- maior(T, X, R).
maior([], R, R) :- !.
maior([X | T], Max, R) :- Max1 is max(X, Max),
                          maior(T, Max1, R).

% nessa versão, a lista vai sendo reduzida e o valor max só é instanciado por último
% maior([X], X) :- !.
% maior([X | T], Max) :- maior(T, Max1), Max is max(X, Max1).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%5. recuperar um elemento pelo índice
recuperar_por_indice([X | _], 0, X) :- !.
recuperar_por_indice([_ | Xs], I, E) :- Ix is I-1,
										recuperar_por_indice(Xs, Ix, E). % o índice indica quantas recursões foram feitas até chegar na cabeça

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%P6: Recuperar o índice de um elemento.
recuperar_indice(L, E, R) :- recuperar_indice(L, E, 0, R).
recuperar_indice([E | _], E, R, R) :- !.
recuperar_indice([_ | Xs], E, Acc, R) :- Acc1 is Acc + 1,
                                         recuperar_indice(Xs, E, Acc1, R).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% P7: Somar duas listas dois a dois
%versão 2
somar_2a2([], [], []).
somar_2a2(L1, L2, R) :- somar_2a2(L1, L2, [], R).
somar_2a2([], [], R, R) :- !.
somar_2a2([X | L1], [Y | L2], AUX, R) :- Z is X + Y,
                                   append(AUX, [Z], AUX1),
                                   somar_2a2(L1, L2, AUX1, R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Q2: Regra para concatenar duas listas.
concatena(L1,L2,R) :- append(L1,L2,R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Q3: Regra para concatenar duas listas dois a dois.
concatena_2a2(L1,L2,Lconcatenada) :- concatena_2a2(L1,L2,[],Lconcatenada).

concatena_2a2([],[],Lresultante,Lresultante):- !.
concatena_2a2([H1|T1],[H2|T2],Lresult,Lconcatenada) :-append([H1],[H2],R),
                                                       append(Lresult,R,Laux),
                                                       concatena_2a2(T1,T2,Laux,Lconcatenada).

%concatena_2a2([1,2,3],[10,4,6],ListaConcatenada).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Q4: Regra para somar as listas que estão dentro de uma lista. Exemplo: [[1,2,3],[1,1,1]] gera a saída [6, 3].
somaSubListas(L1,Lresultante) :- somaSubListas(L1,[],Lresultante).
somaSubListas([],Lresultante,Lresultante) :- !.
somaSubListas([L | T],Lresult,Lresultante) :- soma(L,Rsoma),
                                  append(Lresult,[Rsoma],Laux),
                                  somaSubListas(T,Laux,Lresultante).

soma([], 0). % só dá mach se a lista for vazia
soma([H | T], N) :- soma(T, N1), N is N1 + H.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Q5: Regra para encontrar o último elemento na lista.
findLastElement(L) :-	reverse(L,[H|_]),
                        write('Último Elemento: '),
                        write(H).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Q6: Regra para contar elementos contíguos 2 a 2 em uma lista.
contaContiguos_2a2(L,R) :- contaContiguos_2a2(L,0,R),!.
contaContiguos_2a2([],R,R):- !.
contaContiguos_2a2([E1, E1| T],CountAux,R):- CountAux1 is CountAux + 1,
											contaContiguos_2a2([E1| T],CountAux1 ,R).
contaContiguos_2a2([_ | T],CountAux,R):- contaContiguos_2a2(T,CountAux ,R).

%Q7: Regra para construir a lista reversa.
listaReversa(L,R) :- reverse(L,R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Q8: Regra para informar se o elemento está na lista.
verificaElemento([H|_],H) :-	write('Elemento está na lista'),!.
verificaElemento([_|T],Elemento):- verificaElemento(T,Elemento).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Q9: Regra para informar os elementos duplicados, considerando a ordem em que eles aparecem na lista.
freq(V, L, R) :- freq(V, L,0, R).% chamada do usuário em que se quer saber R que é a frequência de V na lista L
freq(_,[],R,R). % =freq(V,[],R,R) :- !.. passo base
freq(V, [V | T], Acc, R) :- Acc1 is Acc + 1, %verifica se o valor é a cabeça da lista acc-> auxiliar pra soma de acc1-> vai caminhando na recursão
						freq(V,T,Acc1,R). % como se voltasse pro início do loop percorrendo o resto da lista
freq(V,[X|T],Acc,R) :- V \== X,
				freq(V,T,Acc,R).


elementosDuplicados(L,Lduplicados) :-elementosDuplicados(L,[],Lduplicados).
elementosDuplicados([],Lresult,Lresult) :- !.
elementosDuplicados([H|T],Laux,Lresult):- freq(H,[H|T],Freq),
				  Freq =:= 2,
                                  append(Laux,[H],Proxl),
				 elementosDuplicados(T,Proxl,Lresult),!.
elementosDuplicados([H|T],Laux,Lresult):-freq(H,[H|T],Freq),
                                 Freq \== 2,
				elementosDuplicados(T,Laux,Lresult).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Q10 Elimina elementos duplicados
eliminaDuplicados(L,R):- elementosDuplicados(L,Duplicados),
				    eliminaElemento(L,Duplicados,R),!.
eliminaElemento(Raux,[],Raux):- !.
eliminaElemento(L,[H|T],R) :- delete(L,H,Raux),
                              eliminaElemento(Raux,T,R).
