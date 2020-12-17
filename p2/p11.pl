% prim(Number: integer, Counter:integer)
% model de flux (i,i)
% Number - numarul pe care il verificam daca este prim
% Counter - numarul la care vad restul operatiei Number mod Counter

% model matematic
% prim(Number, Counter) =  
%   true, daca c = 1
%   prim(n, c-1), daca n > 2 && n % c != 0
%   false, altfel

prim(_, 1).
prim(Number, Counter):-
    Number > 2, 
    0 =\= Number mod Counter,
    Counter1 is Counter - 1,
    prim(Number, Counter1).

% doublePrimNrList(L: list, R:list)
% model de flux(i,o)
% L - lista de input
% R - lista rezultat

% model matematic
% doublePrimNrList(l1...ln]) = 
%   [], daca n = 0
%   [l1, l1] U doublePrimNrList(l2...ln]), daca prim(l1, l1-1) =:= true
%   [l1] U doublePrimNrList(l2...ln), altfel
doublePrimNrList([],[]).
doublePrimNrList([H|T], [H,H,H|R]):-
    H1 is H - 1,
    prim(H, H1),
    doublePrimNrList(T,R),!.
doublePrimNrList([H|T], [H|R]):-
    doublePrimNrList(T,R).


% doublePrimSublist(L: list, R: list)
% doublePrimSublist(i,o)
% L - lista de input
% R - lista rezultat

% model matematic
% doublePrimSublist(l1...ln)
%   [], daca n = 0
%   doublePrimNrList(l1) U doublePrimSublist(l2...ln), daca l1 este lista
%   [l1] U doublePrimSubList(l2...ln), altfel
doublePrimSublist([],[]).
doublePrimSublist([H|T],[Sublist|R]):-
    is_list(H),!,
    doublePrimNrList(H,Sublist),
    doublePrimSublist(T,R).
doublePrimSublist([H|T],[H|R]):-
    doublePrimSublist(T,R).