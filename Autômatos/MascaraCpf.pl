inicio(q1).
final(qf).

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


p(q3,'0',q4).
p(q3,'1',q4).
p(q3,'2',q4).
p(q3,'3',q4).
p(q3,'4',q4).
p(q3,'5',q4).
p(q3,'6',q4).
p(q3,'7',q4).
p(q3,'8',q4).
p(q3,'9',q4).

p(q4,'.',q1).
p(q4,'-',q5).

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

p(q6,'0',qf).
p(q6,'1',qf).
p(q6,'2',qf).
p(q6,'3',qf).
p(q6,'4',qf).
p(q6,'5',qf).
p(q6,'6',qf).
p(q6,'7',qf).
p(q6,'8',qf).
p(q6,'9',qf).

teste(X) :- string_chars(X, Fita),
 			inicio(No),
 			reconhecedor(No, Fita),!.

reconhecedor(No,[]) :- final(No).
reconhecedor(De,Fita) :-p(De, X, Para),
 						caminha(X, Fita, Nova_Fita),
 						reconhecedor(Para, Nova_Fita).
caminha(H,[H | T],T).