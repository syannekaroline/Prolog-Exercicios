inicio(q1).
final(q2).
p(q1,0,q1).
p(q1,1,q2).
p(q2,0,q3).
p(q2,1,q2).
p(q3,0,q2).
p(q3,1,q2).
teste(Fita) :-inicio(No),
 reconhecedor(No, Fita).
reconhecedor(No,[]) :- final(No).
reconhecedor(De,Fita) :- p(De, X, Para),
 				 		 caminha(X, Fita, Nova_Fita),
 						 reconhecedor(Para, Nova_Fita).
caminha(H,[H | T],T).