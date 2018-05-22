:-['anoxiaKB.pl'].

anoxia(Result) :-
  write('Do you have lab Data?(yes/no)'), %print message for user
  nl,
  read(Input),  %read input from user
  nl,
  anoxiaLabValues(Input,Result).
  %anoxiaNoLabValues(Input,[Oligochaetes, Sediments, H2S, CH4, Substrate, Smell],Answer)),
  %Result = Answer.
  %bagof(Answer,rule(Input,[Oxygen,NO3,Oligochaetes, Sediments, H2S, CH4, Substrate, Smell], Aswer), Result).


anoxiaLabValues(yes,Res):-
  write('What is the percentage of oxygen?'),
  nl,
  read(Oxygen),
  nl,
  oxygenLow(Oxygen,NO3),
  bagof(Answer,rule(data(yes,[Oxygen,NO3],Answer)),Res).
  %Values = [Oxygen, NO3].

oxygenLow(Oxygen, NO3):-
  number(Oxygen),
  Oxygen < 20,
  write('Is NO3 present? (yes/no)'),
  nl,
  read(NO3),
  nl.

oxygenLow(Oxygen,NO3):-
  number(Oxygen),
  Oxygen >=20,
  NO3 = no.
