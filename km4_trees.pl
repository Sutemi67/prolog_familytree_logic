% Вариант 20. Экспертная система: определение породы дерева
 
:- dynamic xpositive/2, xnegative/2.
:- encoding(utf8).
:- set_stream(user_output, encoding(utf8)).
:- set_stream(user_input,  encoding(utf8)).

run :-
    nl, write('* * * * * * * * * * * * * * * * * * * * *'),
    nl, write('        ДОБРО ПОЖАЛОВАТЬ!'),
    nl, write('  Проводится идентификация дерева'),
    nl, write('  Отвечайте, пожалуйста, да или нет'),
    nl, write('* * * * * * * * * * * * * * * * * * * * *'),
    nl, expertiza.
 
expertiza :-
    tree_is(X), !,
    nl, write('Вероятно, это дерево – '), write(X), write('.'), nl,
    clear_facts.
expertiza :-
    nl, write('Извините, я не смогу помочь Вам!'), nl,
    clear_facts.
 
% задать вопрос пользователю
vopros(X, Y) :-
    write('вопрос – '), write(X), write(' '), write(Y),
    write('? (да/нет) '),
    read(R),
    remember(X, Y, R).
 
% проверка признака: уже известен / не отвергнут ранее -> спросить
positive(X, Y) :- xpositive(X, Y), !.
positive(X, Y) :- not(negative(X, Y)), !, vopros(X, Y).
 
negative(X, Y) :- xnegative(X, Y), !.
 
% запоминание ответов
remember(X, Y, 'да')  :- assertz(xpositive(X, Y)).
remember(X, Y, 'нет') :- assertz(xnegative(X, Y)), fail.
 
% очистка рабочей области
clear_facts :- retract(xpositive(_, _)), fail.
clear_facts :- retract(xnegative(_, _)), fail.
clear_facts.
 
% ---------- База знаний: хвойные деревья ----------
tree_is('Лиственница') :-
    positive('это', 'хвойное дерево'),
    positive('у него', 'хвоя, опадающая на зиму'), !.
tree_is('Сосна') :-
    positive('это', 'хвойное дерево'),
    positive('у него', 'хвоя, растущая парами'), !.
tree_is('Ель') :-
    positive('это', 'хвойное дерево'),
    positive('у него', 'колючая хвоя'),
    positive('у него', 'шишки, свисающие вниз'), !.
tree_is('Пихта') :-
    positive('это', 'хвойное дерево'),
    positive('у него', 'плоская мягкая хвоя'),
    positive('у него', 'шишки, направленные вверх'), !.
 
% ---------- База знаний: лиственные деревья ----------
tree_is('Берёза') :-
    positive('это', 'лиственное дерево'),
    positive('у него', 'белая кора'), !.
tree_is('Дуб') :-
    positive('это', 'лиственное дерево'),
    positive('у него', 'листья с округлыми лопастями'),
    positive('у него', 'плоды – жёлуди'), !.
tree_is('Клён') :-
    positive('это', 'лиственное дерево'),
    positive('у него', 'пальчатые листья с острыми лопастями'),
    positive('у него', 'плоды – двойные крылатки'), !.
tree_is('Липа') :-
    positive('это', 'лиственное дерево'),
    positive('у него', 'сердцевидные листья'),
    positive('у него', 'душистые жёлтые цветки'), !.
