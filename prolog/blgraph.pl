edge(a, b).
edge(a, c).
edge(b, c).
edge(c, f).
edge(d, e).

connected(A, B) :-
  edge(A, B); edge(B, A).

unseen(Node, Seen) :-
  \+member(Node, Seen).

go(From, To, Seen, [To|Seen]) :-
  connected(From, To).

go(From, To, Seen, Path) :-
  connected(From, Between),
  dif(Between, To),
  unseen(Between, Seen),
  go(Between, To, [Between|Seen], Path).

path(From, To, Result) :-
  go(From, To, [From], Path),
  reverse(Path, Result).

path_with_length(From, To, Length, Path) :-
  path(From, To, Path),
  length(Path, Length).

min_path(From, To, Length, Path) :-
  aggregate(min(L, P), path_with_length(From, To, L, P), min(Length, Path)).

max_path(From, To, Length, Path) :-
  aggregate(max(L, P), path_with_length(From, To, L, P), max(Length, Path)).
