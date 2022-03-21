tweep(luke).
tweep(obie).
tweep(yoda).
tweep(amis).
tweep(appo).

tweet(declaration).

tweets(appo, declaration).

follows(luke, obie).
follows(obie, yoda).
follows(yoda, amis).
follows(amis, appo).

fan(luke, obie).
fan(obie, yoda).
fan(yoda, amis).
fan(amis, appo).

blocks(appo, amis).

fancies(Fan, Star) :-
  fan(Fan, Star);
  fan(Middle, Star),
  fancies(Fan, Middle).

retweets(Fan, What) :-
  tweets(Star, What),
  fancies(Fan, Star).

says(Tweep, What) :-
  tweets(Tweep, What);
  retweets(Tweep, What).

reaches(Tweep, Who) :-
  \+ blocks(Who, Tweep),
  (
    follows(Tweep, Who);
    follows(Tweep, Middle),
    reaches(Middle, Who)
  ).

receives(Tweep, What) :-
  tweets(Tweep, What);
  says(Who, What),
  reaches(Tweep, Who).
