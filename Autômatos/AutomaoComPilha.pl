inicio(q1).
final(q1).
final(q4).

% (simbolo lido da pilha, desempilhado, empilhado)
/*
 * f : q1,e,e -> q2, $(empilha)
 * f: q2,0,e -> q2,0 ---> a busca do primeiro elemento vai ser a partir de q2 pq de primeira ele empilha o $
 * f: q2,1,0 -> q3,e
 * f: q3,1,0 -> q3,e
 * f: q3,e,$ -> q4,e 
 * ele empilha o $ no início e o $ no final pra saber que ao chegar no final a fita e a
 * pilha estão vazias -> estratégia de usar um símbolo pra verificar a validação da palavra
 * a estratégia do $ é o teste da pilha vazia*/

% representando as funções de transição -> vão conter 5 termos (vertice, caracter lido, caracter desempilhado, caracter empilhado, estado alcançado)
f(q1,e,e,$,q2). estando no vertice 1, lendo vazio, desemilhando 
f(q2,0,e,0,q2).
f(q2,1,0,e,q3).
f(q3,1,0,e,q3).
f(q3,e,$,e,q4).


teste(X) :- tring_chars(X,Fita),
    			inicio(No),
 			  reconhecedor(No, Fita,[]). % a pilha sempre coeça vazia

reconhecedor(No,[],[]) :- final(No).
% enquanto a pilha não estiver vazia ele vai caminhando até que a pilha esteja vazia- atualização da pilha quando a fita tá vazia
reconhecedor(de,[],Pilha): f(De,e,De,E,Para)
							atualizar_pilha(Pilha,De,Empilha,Nova_pilha),
							reconhecedor(Para,[],Nova_pilha).
							
							% a fita tá vazia mas ainda tem p $ na pilha  -> se deve atualizar a pilhha 
% na atualização da pilha -> primeiro desempilha e depois emilha
atualizar_pilha(Pilha,De,Empilha,Nova_pilha):- leitura(Pilha,De,Aux),
    											escrita(Aux,Empilha,Nova_pilha).

% leitura 
leitura([De|Pilha],De,Pilha). % onde de fato ocorre ao desempilhamento 
leitura(Pilha,e,Pilha).

% escrita
escrita(Pilha, e,Pilha):- !. % tem que ter o cut pra ele n testar as prox
escrita(Pilha, Empilha,[Empilha,Pilha]). % caso escreva o movimento vazio

% reconhecedor 
reconhecedor(De,Fita,Pilha) :- f(De,e,D, Empilha, Para),
                              atualiza_pilha(Pilha,De,Empilha,Nova_pilha),
                              reconhecedor(Para, Fita,Nova_pilha).

reconhecedor(De,Fita,Pilha) :- f(De,Caracter,De, Empilha, Para),
    							Caracter \== e,
                                caminha(Fita,Caracter,Nova_Fita),
    							atualizar(Pilha,De,Empilha,Nova_pilha),
    							reconhecedor(Para,Nova_Fita,Nova_pilha).

caminha([Caracter|Fita],Caracter,Fita).