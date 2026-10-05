:- encoding(utf8).

% Факты о людях: person(Имя, Пол)
% Уровень 1
person('Иван', male).
person('Мария', female).

% Уровень 2
person('Анна', female).
person('Пётр', male).

% Уровень 3
person('Ольга', female).
person('Сергей', male).

% Уровень 4
person('Дмитрий', male).
person('Елена', female).
person('Татьяна', female).

% Факты о родительских связях: parent(Родитель, Потомок)
% 1 -> 2
parent('Иван', 'Анна').
parent('Иван', 'Пётр').
parent('Мария', 'Анна').
parent('Мария', 'Пётр').

% 2 -> 3
parent('Анна', 'Ольга').
parent('Пётр', 'Сергей').

% 3 -> 4
parent('Ольга', 'Дмитрий').
parent('Сергей', 'Елена').
parent('Сергей', 'Татьяна'). % Татьяна — сестра Елены, дочь Сергея

% Вспомогательное правило: X и Y - родные брат или сестра
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Целевое правило: X является племянницей Y
niece(X, Y) :- 
    person(X, female), 
    parent(P, X), 
    sibling(Y, P).