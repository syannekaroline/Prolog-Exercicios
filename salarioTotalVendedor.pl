%escreva uma regra que receba o salário base de um vendedor, o toral de
% venda efetuadas por ele no mês e o total a receber por ele no final do
% mês
% Sabe-se que o total a receber no final do mês é igual ao salário base
% mais 15% das vendas efetuadas pelo funcionário

salarioTotalVendedor:- write('Insira o valor do salário base: R$'),
                        read(Sbase),
                        write('insira o total de vendas efetuadas: '),
                        read(Tvendas),
                        calculoSalarioTotal(Sbase,Tvendas,Stotal),
                        write('O salário total é de R$'),write(Stotal),!.
calculoSalarioTotal(Sbase,Tvendas,Stotal) :- Stotal is Sbase + Tvendas * 0.15,!.
