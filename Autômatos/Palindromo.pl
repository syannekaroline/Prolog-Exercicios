
% l = {w | W é palíndromo em {a,b}*}

inicio(0).
final(3).

q(0, 'e', 'e', '$', 1).
q(1, 'a', 'e', 'a', 1).
q(1, 'b', 'e', 'b', 1).
q(1, 'e', 'e', 'e', 2).
q(2, 'a', 'a', 'e', 2).
q(2, 'b', 'b', 'e', 2).
q(2, 'e', '$', 'e', 3).

teste(X) :- string_chars(X, Fita),
 			inicio(No),
 			reconhecedor(No, Fita, []), !.

reconhecedor(No, [], []) :- final(No), !.

reconhecedor(De,[], Pilha) :- q(De, e, L, E, Para), 
 							atualiza_pilha(Pilha, L, E, Nova_Pilha),
 							reconhecedor(Para, [], Nova_Pilha).


reconhecedor(De,Fita, Pilha) :- q(De, X, L, E, Para),
 								X \== e,
 								caminha(X, Fita, Nova_Fita),
 								atualiza_pilha(Pilha, L, E, Nova_Pilha),
 								reconhecedor(Para, Nova_Fita, Nova_Pilha).

reconhecedor(De,Fita, Pilha) :- q(De, e, L, E, Para), 
 								atualiza_pilha(Pilha, L, E, Nova_Pilha),
 								reconhecedor(Para, Fita, Nova_Pilha).
								caminha(H,[H | T],T).


atualiza_pilha(Pilha, L, D, Nova_Pilha) :-	atualiza_leitura(Pilha, L, P1),
 											atualiza_escrita(P1, D, Nova_Pilha).


atualiza_leitura([L | Pilha], L, Pilha).
atualiza_leitura(Pilha, e, Pilha).
atualiza_escrita(Pilha, E, [E | Pilha]) :- E \== e, !.

atualiza_escrita(Pilha, e, Pilha).