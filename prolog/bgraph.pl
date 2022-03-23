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
