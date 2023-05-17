inicio(q0).
final(qf).

p(p0,'(',q1).

p(q1,'0',q2).
p(q1,'1',q2).
p(q1,'2',q2).
p(q1,'3',q2).
p(q1,'4',q2).
p(q1,'5',q2).
p(q1,'6',q2).
p(q1,'7',q2).
p(q1,'8',q2).
p(q1,'9',q2).

p(q2,'0',q3).
p(q2,'1',q3).
p(q2,'2',q3).
p(q2,'3',q3).
p(q2,'4',q3).
p(q2,'5',q3).
p(q2,'6',q3).
p(q2,'7',q3).
p(q2,'8',q3).
p(q2,'9',q3).

p(q3,')',q4)

p(q4,'0',q5).
p(q4,'1',q5).
p(q4,'2',q5).
p(q4,'3',q5).
p(q4,'4',q5).
p(q4,'5',q5).
p(q4,'6',q5).
p(q4,'7',q5).
p(q4,'8',q5).
p(q4,'9',q5).

p(q5,'0',q6).
p(q5,'1',q6).
p(q5,'2',q6).
p(q5,'3',q6).
p(q5,'4',q6).
p(q5,'5',q6).
p(q5,'6',q6).
p(q5,'7',q6).
p(q5,'8',q6).
p(q5,'9',q6).

p(q5,'0',q6).
p(q5,'1',q6).
p(q5,'2',q6).
p(q5,'3',q6).
p(q5,'4',q6).
p(q5,'5',q6).
p(q5,'6',q6).
p(q5,'7',q6).
p(q5,'8',q6).
p(q5,'9',q6).


p(q5,'0',q6).
p(q5,'1',q6).
p(q5,'2',q6).
p(q5,'3',q6).
p(q5,'4',q6).
p(q5,'5',q6).
p(q5,'6',q6).
p(q5,'7',q6).
p(q5,'8',q6).
p(q5,'9',q6).


p(q5,'0',q6).
p(q5,'1',q6).
p(q5,'2',q6).
p(q5,'3',q6).
p(q5,'4',q6).
p(q5,'5',q6).
p(q5,'6',q6).
p(q5,'7',q6).
p(q5,'8',q6).
p(q5,'9',q6).


teste(X) :- string_chars(X, Fita),
 			inicio(No),
 			reconhecedor(No, Fita),!.

reconhecedor(No,[]) :- final(No).
reconhecedor(De,Fita) :-p(De, X, Para),
 						caminha(X, Fita, Nova_Fita),
 						reconhecedor(Para, Nova_Fita).
caminha(H,[H | T],T).