:- use_module(library(aggregate)).

edge(a, b, 1).
edge(a, c, 3).
edge(b, c, 1).
edge(c, f, 2).
edge(d, e, 2).

connected(A, B, Weight) :-
  edge(A, B, Weight); edge(B, A, Weight).

unseen(Node, Seen) :-
  \+member(Node, Seen).

go(From, To, Seen, PartialWeight, Weight, [To|Seen]) :-
  connected(From, To, W),
  Weight is PartialWeight + W.

go(From, To, Seen, PartialWeight, Weight, Path) :-
  connected(From, Between, W),
  dif(Between, To),
  unseen(Between, Seen),
  go(Between, To, [Between|Seen], PartialWeight + W, Weight, Path).

path(From, To, Weight, Path) :-
  go(From, To, [From], 0, Weight, Reversed),
  reverse(Reversed, Path).

min_path(From, To, Weight, Path) :-
  aggregate(min(W, P), path(From, To, W, P), min(Weight, Path)).

max_path(From, To, Weight, Path) :-
  aggregate(max(W, P), path(From, To, W, P), max(Weight, Path)).


