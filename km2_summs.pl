% Вариант 5: S = sum_{i=1..n} (-1)^(i+1) / (2i-1)
 
% sign(+I, -Sg): знак i-го члена ряда, (-1)^(i+1)
sign(I, 1)  :- I mod 2 =:= 1.
sign(I, -1) :- I mod 2 =:= 0.
 
% term(+I, -T): значение i-го члена ряда
term(I, T) :-
    sign(I, Sg),
    T is Sg / (2*I - 1.0).
 
% sum(+N, -S): рекурсивная сумма первых N членов
sum(0, 0.0) :- !.
sum(N, S) :-
    N > 0,
    N1 is N - 1,
    sum(N1, S1),
    term(N, T),
    S is S1 + T.
 
% sum_acc(+N, -S): хвостовая рекурсия с накопителем
sum_acc(N, S) :- sum_acc(N, 0.0, S).
 
sum_acc(0, Acc, Acc) :- !.
sum_acc(N, Acc, S) :-
    N > 0,
    term(N, T),
    Acc1 is Acc + T,
    N1 is N - 1,
    sum_acc(N1, Acc1, S).
