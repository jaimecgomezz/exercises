% souce: https://stackoverflow.com/questions/7893939/implement-for-loop-on-prolog

icecream(N) :-
    loop(N, top(N)),
    left, loop(N+1, center), nl,
    loop(N+1, bottom(N)).

:- meta_predicate loop(+, 1).

loop(XH, PR) :-
    H is XH,
    forall(between(1, H, I), call(PR, I)).

top(N, I) :-
    left, spc(N-I+1), pop,
    (   I > 1
    ->  pop,
        spc(2*(I-2)),
        pcl
    ;   true
    ),
    pcl, nl.

bottom(N, I) :-
    left, spc(I-1), put(\), spc(2*(N-I+1)), put(/), nl.

center(_) :- put(/), put(\).

left :- spc(4).
pop :- put(0'().
pcl :- put(0')).
spc(Ex) :- V is Ex, forall(between(1, V, _), put(0' )).
