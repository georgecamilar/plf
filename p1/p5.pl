%nrAp(L: list, El:element to be found, S: int as result)


deleteApp([],_,[]).
deleteApp([H|T], E, [H|R]):-
    H \= E,
    deleteApp(T,E,R).
deleteApp([H|T],E,R):-
    H=E,
    deleteApp(T,E,R).



countElementInList([], _, 0).
countElementInList([H|T], El, R):-
    H = El,
    countElementInList(T,El,R1),
    R is R1 + 1.
countElementInList([H|T], El, R):-
    H \= El,
    countElementInList(T, El, R).

countEachEl([], []).
countEachEl([H|T], [[H, Rc]|R]):-
    countElementInList([H|T],H,Rc),
    deleteApp(T,H,RR),
    countEachEl(RR,R).