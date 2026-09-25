:- encoding(utf8).

person('Иван', male).
person('Мария', female).
person('Анна', female).
person('Пётр', male).
person('Ольга', female).
person('Сергей', male).
person('Дмитрий', male).
person('Елена', female).

parent('Иван', 'Анна').
parent('Иван', 'Пётр').
parent('Мария', 'Анна').
parent('Мария', 'Пётр').
parent('Анна', 'Ольга').
parent('Ольга', 'Дмитрий').
parent('Пётр', 'Сергей').
parent('Сергей', 'Елена').

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

niece(X, Y) :-
    person(X, female),
    parent(P, X),
    once(sibling(P, Y)).