% Remove multiple matches from list 
% remover( _, [], []).
% remover( R, [R|T], T2) :- remover( R, T, T2).
% remover( R, [H|T], [H|T2]) :- H \= R, remover( R, T, T2).

% Remove first match from list
remove( _, [], []).
remove( R, [R|T], T).
remove( R, [H|T], [H|T2]) :- H \= R, remover( R, T, T2).
