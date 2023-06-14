% Fatos
:- dynamic receita/1.
:- dynamic gasto_diario/2.
receita(0).

% Regras
zerar_gasto_diario:- data(X),
                    retract(gasto_diario(X,_)),
                    assertz(gasto_diario(X,0)),!.

total_recebido:-    receita(Valor),
                    format('Total recebido: R$~w .',[Valor]).

total_despesas :- gasto_diario(_,Valor),
                format('Total de despesas: R$~w .',[Valor]).

receber_pagamento(Valor) :-
                        receita(SaldoAtual),
                        NovoSaldo is SaldoAtual + Valor,
                        retract(receita(SaldoAtual)),
                        assertz(receita(NovoSaldo)).

registrar_saida(Valor):-
                        date(D),
                        assertz(gasto_diario(D,Valor)).

registrar_saida(Data, Valor) :-
    gasto_diario(Data, GastoAtual),
    NovoGasto is GastoAtual + Valor,
    retract(gasto_diario(Data, GastoAtual)),
    assertz(gasto_diario(Data, NovoGasto)).

calcular_lucro(Data, Lucro) :-
    receita(SaldoInicial),
    registrar_saida(Data, GastoDiario),
    Lucro is SaldoInicial - GastoDiario.

calcular_deficit(Data, Deficit) :-
    receita(SaldoInicial),
    registrar_saida(Data, GastoDiario),
    Deficit is GastoDiario - SaldoInicial.

% criar uma pra gerar extrato
% descrever as regras e fatos.