color(Color) :- member(Color, [red, yellow, blue]).

border(CountryA, CountryB) :-
  color(CountryA),
  color(CountryB),
  dif(CountryA, CountryB).

coloring(Chile, Argentina, Bolivia, Uruguay, Paraguay Peru) :-
  border(Chile, Argentina),
  border(Chile, Bolivia),
  border(Chile, Peru),
  border(Peru, Bolivia),
  border(Bolivia, Paraguay),
  border(Argentina, Bolivia),
  border(Argentina, Uruguay),
  border(Argentina, Paraguay).
