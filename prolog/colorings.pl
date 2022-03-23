borders([]).
borders([Border | Borders]) :-
  [Country | [Another | _]] = Border,
  dif(Country, Another),
  borders(Borders).

colorize([], _).
colorize([Country | Countries], Colors) :-
  member(Country, Colors),
  colorize(Countries, Colors).

colorings(Colors, Countries, Borders) :-
  length(Colors, 4), % see:1
  borders(Borders),
  colorize(Countries, Colors).

colorings(
  ['r', 'g', 'y', 'b'],
  [Chile, Argentina, Bolivia, Uruguay, Paraguay, Peru],
  [
    [Chile, Argentina],
    [Chile, Bolivia],
    [Chile, Peru],
    [Peru, Bolivia],
    [Bolivia, Paraguay],
    [Argentina, Bolivia],
    [Argentina, Uruguay],
    [Argentina, Paraguay]
  ]
).

% [1] https://en.wikipedia.org/wiki/Four_color_theorem
