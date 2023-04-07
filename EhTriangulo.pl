% leia 3 valores reais (A<B<C) e verifique se formam ou não um
% triângulo. em caso positivo , calcule o perímero do triângulo e
% apresente a mensagem: Perímetro = xx.x
% em caso negativo, calcule a área do trapézio que tem Ae B como base e
% C como altura, mostrando a msg: área = Xx.x


eh_triangulo(A,B,C,R) :- A + B > C, A+C > B , B+C > A, X is A+B+C,
                          atom_concat('Perímetro = ',X,R),!.
eh_triangulo(A,B,C,R) :- X is ((A+B) * C)/2, atom_concat('Área = ',X,R).
