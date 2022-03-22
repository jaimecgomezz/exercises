:- use_module(library(clpfd)).

safe_diagonal(Q1, Q2, Distance) :-
  abs(Q2 - Q1) #\= Distance.

safe_queen(_, [], _).
safe_queen(Queen, [Qn | Queens], Difference) :-
  safe_diagonal(Queen, Qn, Difference),
  safe_queen(Queen, Queens, Difference + 1).

safe([]).
safe([Queen | Queens]) :-
  safe_queen(Queen, Queens, 1),
  safe(Queens).

queens(Queens) :-
  length(Queens, 8),
  Queens ins 1..8,
  all_distinct(Queens),
  safe(Queens).
