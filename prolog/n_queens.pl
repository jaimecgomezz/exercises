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

header(N) :-
  ConcreteN is N,
  print(ConcreteN), put_char('\t').

headers(0).
headers(N) :-
  put_char(0' ), put_char(0' ),
  forall(between(1, N, V), header(V)),
  nl.

indent(Level, Row) :-
  H is Level - 1,
  ConcreteRow is Row,
  print(ConcreteRow), put_char(0' ), forall(between(1, H, _), put_char('\t')).

show([]).
show(Queens) :-
  length(Queens, N),
  headers(N),
  show(Queens, 0).
show([], _).
show([Queen | Queens], Row) :-
  indent(Queen, Row + 1), writef("Q%t", [Queen]), nl, nl,
  show(Queens, Row + 1).

queens(N, Queens) :-
  length(Queens, N),
  Queens ins 1..N,
  all_distinct(Queens),
  safe(Queens),
  label(Queens),
  show(Queens).
