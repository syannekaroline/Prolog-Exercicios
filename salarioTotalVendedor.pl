%escreva uma regra que receba o sal�rio base de um vendedor, o toral de
% venda efetuadas por ele no m�s e o total a receber por ele no final do
% m�s
% Sabe-se que o total a receber no final do m�s � igual ao sal�rio base
% mais 15% das vendas efetuadas pelo funcion�rio

salarioTotalVendedor:- write('Insira o valor do sal�rio base: R$'),
                        read(Sbase),
                        write('insira o total de vendas efetuadas: '),
                        read(Tvendas),
                        calculoSalarioTotal(Sbase,Tvendas,Stotal),
                        write('O sal�rio total � de R$'),write(Stotal),!.
calculoSalarioTotal(Sbase,Tvendas,Stotal) :- Stotal is Sbase + Tvendas * 0.15,!.
