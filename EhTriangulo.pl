% leia 3 valores reais (A<B<C) e verifique se formam ou n�o um
% tri�ngulo. em caso positivo , calcule o per�mero do tri�ngulo e
% apresente a mensagem: Per�metro = xx.x
% em caso negativo, calcule a �rea do trap�zio que tem Ae B como base e
% C como altura, mostrando a msg: �rea = Xx.x


eh_triangulo(A,B,C,R) :- A + B > C, A+C > B , B+C > A, X is A+B+C,
                          atom_concat('Per�metro = ',X,R),!.
eh_triangulo(A,B,C,R) :- X is ((A+B) * C)/2, atom_concat('�rea = ',X,R).
