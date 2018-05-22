%% Advanced Topics in Artificial Intelligence
%% TEI of Crete
%% Barianos Kristofer Anastasios   MTP179
%% Spring Semester 2018


%%Knowledge base for anoxia levels in water


rule(data(yes, [Oxygen, NO3, Oligochaetes, Sediments, H2S, CH4, Sediments, Smells]),Answer):-
	Oxygen >= 20,  
	Answer = ' No Problem Of Anoxia'.

rule(data(yes,[Oxygen, NO3, Oligochaetes, Sediments, H2S, CH4, Substrate, Smell]), Answer) :-
  number(Oxygen),
  Oxygen < 20,
  NO3 = yes,
  Answer = 'Severe problem of anoxia'.



rule(data(yes,[Oxygen, NO3, Oligochaetes, Sediments, H2S, CH4, Substrate, Smell]), Answer) :-
  Oxygen < 20,
  NO3 = no,
  Answer = 'Very severe problem of anoxia'.

rule(data(no,[Oxygen, NO3, Oligochaetes, Sediments, H2S, CH4, Substrate, Smell]), Answer) :-
  Oligochaetes = few,
  Answer = 'Very severe problem of anoxia'.

rule(data(no,[Oxygen, NO3, Oligochaetes, Sediments, H2S, CH4, Substrate, Smell]), Answer) :-
  Oligochaetes = yes,
  Answer = 'Moderate anoxia'.

rule(data(no,[Oxygen, NO3, Oligochaetes, Sediments, H2S, CH4, Substrate, Smell]), Answer) :-
  Oligochaetes = no,
  (Sediments = dark ; Sediments = black),
  H2S = yes,
  Answer = 'Very severe problem of anoxia'.

rule(data(no,[Oxygen, NO3, Oligochaetes, Sediments, H2S, CH4, Substrate, Smell]), Answer) :-
  Oligochaetes = no,
  (Sediments = dark ; Sediments = black),
  H2S = no,
  CH4 = yes,
  Answer = 'Very severe problem of anoxia'.

rule(data(no,[Oxygen, NO3, Oligochaetes, Sediments, H2S, CH4, Substrate, Smell]), Answer) :-
  Oligochaetes = no,
  (Sediments = dark ; Sediments = black),
  H2S = no,
  CH4 = no,
  Answer = 'Severe problem of anoxia'.


rule(data(no,[Oxygen, NO3, Oligochaetes, Sediments, H2S, CH4, Substrate, Smell]), Answer) :-
  Oligochaetes = no,  %%if there are no oligochaetes
  Sediments = light,  %% and sediment is ligt
  (Substrate = middle ; Substrate = big), %% and the substrare is big or middle
  Answer = 'No problem of anoxia'. %% there is no problem

%%Ariving at the next two rules means that there are no oligochaetes,
%%      the sediment is light and the substrate is fine
%%      smell is only checked under these conditions so in order to save computations
%%      we can check for the smell only, knowing the results will be right.
%%However it is a shortcut that could bring us problems in larger programs

rule(data(no,[Oxygen, NO3, Oligochaetes, Sediments, H2S, CH4, Substrate, Smell]), Answer) :-
  Smell = no, %if the watet doenst smell then there is no anoxia
  Answer = 'No problem of anoxia'.

rule(data(no,[Oxygen, NO3, Oligochaetes, Sediments, H2S, CH4, Substrate, Smell]), Answer) :-
  Smell = yes, %if the water smells there is modeate anoxia
  Answer = 'Moderate anoxia'.
