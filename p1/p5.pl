% deleteApp(L: list, El: int, R: list)
% model de flux(i,i,o).
% L - lista cu elemente
% El - elementul care se va sterge
% R - lista rezultata

% model matematic
% deleteApp(l1...ln, el) =
%   [], daca n = 0
%   [l1] U deleteApp(l2..ln), daca l1 \= el
%   deleteApp(l2...ln), daca l1 = el


deleteApp([],_,[]).
deleteApp([H|T], E, [H|R]):-
    H \= E,
    deleteApp(T,E,R).
deleteApp([H|T],E,R):-
    H=E,
    deleteApp(T,E,R).

% countElementInList(L: list, El: integer, R: integer)
% model de flux(i,i,o)
% L - lista primita
% El - elementul care este numarat
% R - nr de aparitii al elementului

% model matematic
% countElementInList(l1...ln, el) =
%   0, daca n = 0
%   1 + countElementInList(l2...ln, el), daca l1 = el
%   countElementInList(l2...ln, el), altfel

countElementInList([], _, 0).
countElementInList([H|T], El, R):-
    H = El,
    countElementInList(T,El,R1),
    R is R1 + 1.
countElementInList([H|T], El, R):-
    H \= El,
    countElementInList(T, El, R).

% countEachEl(L: list, R: result)
% model de flux (i, o)
% L - lista primita
% R - lista rezultata

% model matematic
% countEachEl(l1...ln) =
%   [], daca  n = 0
%   [l1, countElementInList(l2...ln, l1)] U countEachEl(deleteApp(l2...ln)), altfel
countEachEl([], []).
countEachEl([H|T], [[H, Rc]|R]):-
    countElementInList([H|T],H,Rc),
    deleteApp(T,H,RR),
    countEachEl(RR,R).