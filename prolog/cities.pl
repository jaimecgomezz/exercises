miles(b, a, 80).
miles(b, d, 200).
miles(b, c, 170).
miles(c, a, 200).
miles(d, c, 240).

mpg(tesla, 140).
mpg(hummer, 20).

road(A, B, Miles) :-
  miles(A, B, Miles);
  miles(B, A, Miles).

unseen(A, Seen) :-
  \+ member(A, Seen).

go(From, To, Seen, PartialMiles, Miles, [To|Seen]) :-
  road(From, To, M),
  Miles is PartialMiles + M.

go(From, To, Seen, PartialMiles, Miles, Path) :-
  road(From, Middle, M),
  dif(Middle, To),
  unseen(Middle, Seen),
  go(Middle, To, [Middle|Seen], PartialMiles + M, Miles, Path).

route(From, To, Miles, Path) :-
  go(From, To, [From], 0, Miles, P),
  reverse(P, Path).

shortest_route(From, To, Miles, Path) :-
  aggregate(min(M, P), route(From, To, M, P), min(Miles, Path)).

longest_route(From, To, Miles, Path) :-
  aggregate(max(M, P), route(From, To, M, P), max(Miles, Path)).

cost(MPG, Miles, Cost) :-
  Cost is Miles / MPG.

go_with_cost(From, To, Seen, MPG, PartialCost, Cost, [To|Seen]) :-
  road(From, To, M),
  cost(MPG, M, CurrentCost),
  Cost is PartialCost + CurrentCost.

go_with_cost(From, To, Seen, MPG, PartialCost, Cost, Path) :-
  road(From, Middle, M),
  dif(Middle, To),
  unseen(Middle, Seen),
  cost(MPG, M, CurrentCost),
  go_with_cost(Middle, To, [Middle|Seen], MPG, PartialCost + CurrentCost, Cost, Path).

route_with_cost(From, To, Vehicle, Cost, Path) :-
  mpg(Vehicle, MPG),
  go_with_cost(From, To, [From], MPG, 0, Cost, P),
  reverse(P, Path).

inexpensive_route(From, To, Vehicle, Cost, Path) :-
  aggregate(min(C, P), route_with_cost(From, To, Vehicle, C, P), min(Cost, Path)).

expensive_route(From, To, Vehicle, Cost, Path) :-
  aggregate(max(C, P), route_with_cost(From, To, Vehicle, C, P), max(Cost, Path)).
