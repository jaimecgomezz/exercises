:- use_module(library(clpfd)).

create((A, B)) :- [A, B] ins 0..7.

row_attack((_, Y1), (_, Y2)) :- Y1 #= Y2.
col_attack((X1, _), (X2, _)) :- X1 #= X2.
dia_attack((X1, Y1), (X2, Y2)) :- abs(X2-X1) #= abs(Y2-Y1).

attack(P1, P2) :-
  create(P1),
  create(P2),
  (
    row_attack(P1, P2);
    col_attack(P1, P2);
    dia_attack(P1, P2)
  ).
