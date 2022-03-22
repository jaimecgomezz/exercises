first(First, List) :-
  [First | _] = List.

final(Final, [Final]).
final(Final, [_ | Rest]) :-
  final(Final, Rest).

total([], 0).
total([First | Rest], Sum) :-
  total(Rest, PartialSum),
  Sum is PartialSum + First.

sum(List, Result) :- sum(List, 0, Result).
sum([], Result, Result).
sum([First | Rest], Acc, Result) :-
  sum(Rest, First + Acc, Result).

rev(List, Final) :- rev(List, [], Final).
rev([], Final, Final).
rev([First | Rest], Reversed, Final) :-
  rev(Rest, [First | Reversed], Final).
