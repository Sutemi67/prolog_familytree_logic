run :-
    write('Input N: '), read(N),
    input(N, L1),
    write('L1 = '), write(L1), nl,
    correct(L1), !,
    sort_p(L1, SL),
    write('Sorted list: '), write(SL), nl.
run :- write('error').

input(0, []).
input(N, [X|K]) :- N > 0, write('Input element: '), read(X), M is N-1, input(M, K).

correct([]).
correct([H|T]) :- integer(H), correct(T).

sort_p(L, SL) :- perest(L, K), !, sort_p(K, SL).
sort_p(SL, SL).

perest([X,Y|T], [Y,X|T]) :- X > Y.
perest([Z|T], [Z|T1]) :- perest(T, T1).