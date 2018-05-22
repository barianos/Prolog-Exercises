rule(data(yes, [Oxygen,NO3], Answer)) :-
  number(Oxygen),
  Oxygen >=20,
  Answer = 'No problem of anoxia'.

rule(data(yes,[Oxygen,NO3], Answer)) :-
  number(Oxygen),
  Oxygen < 20,
  presence(NO3),
  Answer = 'Severe problem of anoxia'.


rule(data(yes,[Oxygen,NO3], Answer)) :-
  Oxygen < 20,
  \+ presence(NO3),
  Answer = 'Very severe problem of anoxia'.

rule(data(no,[Oligochaetes, Sediments, H2S, CH4, Substrate, Smell], Answer)) :-
  Oligochaetes = few,
  Answer = 'Very severe problem of anoxia'.

rule(data(no,[Oligochaetes, Sediments, H2S, CH4, Substrate, Smell], Answer)) :-
  Oligochaetes = yes,
  Answer = 'Moderate anoxia'.

rule(data(no,[Oligochaetes, Sediments, H2S, CH4, Substrate, Smell], Answer)) :-
  Oligochaetes = no,
  (Sediments = dark ; Sediments = black),
  H2S = yes,
  Answer = 'Very severe problem of anoxia'.

rule(data(no,[Oligochaetes, Sediments, H2S, CH4, Substrate, Smell], Answer)) :-
  Oligochaetes = no,
  (Sediments = dark ; Sediments = black),
  H2S = no,
  CH3 = yes,
  Answer = 'Very severe problem of anoxia'.

rule(data(no,[Oligochaetes, Sediments, H2S, CH4, Substrate, Smell], Answer)) :-
  Oligochaetes = no,
  (Sediments = dark ; Sediments = black),
  H2S = no,
  CH3 = no,
  Answer = 'Severe problem of anoxia'.


rule(data(no,[Oligochaetes, Sediments, H2S, CH4, Substrate, Smell], Answer)) :-
  Oligochaetes = no,
  Sediments = light,
  (Substrate = middle ; Substrate = big),
  Answer = 'No problem of anoxia'.

rule(data(no,[Oligochaetes, Sediments, H2S, CH4, Substrate, Smell], Answer)) :-
  Oligochaetes = no,
  Sediments = fine,
  Smell = no,
  Answer = 'No problem of anoxia'.

rule(data(no,[Oligochaetes, Sediments, H2S, CH4, Substrate, Smell], Answer)) :-
  Oligochaetes = no,
  Sediments = fine,
  Smell = yes,
  Answer = 'Moderate anoxia'.
