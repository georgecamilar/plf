% model de flux: addEl(i,i,o)
% addEl(N: int, C: int, R: list)
% N = initializat cu numarul de pasi(2*n+1) este contorul care indica pasul curent
% C = initializat cu numarul de pasi(2*n+1) indica numarul de pasi total, folosit pentru a verifica cand suntem la pasul 2*n+1 sa punem 0
%   sau la pasul 2*n sa nu punem 0 
% R = lista colectoare rezultat
addEl(1, _, [0]):-!.

addEl(N, C, [0|R]):-
    N =:= C,
    !,
    N1 is N-1,
    addEl(N1, C, R).

addEl(N, C, [1,H|R]):-
    N1 is N - 1,
    addEl(N1, C, [H|R]),
    H =\= 1.

addEl(N, C, [0,H|R]):-
    N =\= C-1,
    N1 is N - 1,
    addEl(N1, C, [H|R]),    
    H =\= 0.

addEl(N, C, [-1,H|R]):-
    N1 is N - 1,
    addEl(N1, C, [H|R]),
    H =\= -1.


% model de flux (i, o)
% mainAdd(N: int, R: list)
% N = user input (pentru a vedea care e marimea listei(2*n+1))
% R = lista rezultat

mainAdd(N,R):-
    findall(R1, addEl(2*N+1, 2*N+1,R1), R).

% model de flux (i)
% main(N:int)
% N = user input 

main(N):-
    addEl(2*N+1, 2*N+1, R1),
    write(R1),
    write("\n"),
    fail.
main(_).