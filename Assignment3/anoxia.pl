%% Advanced Topics in Artificial Intelligence
%% TEI of Crete
%% Barianos Kristofer Anastasios   MTP179
%% Spring Semester 2018


%%A program that checks for anoxia levels in water
%%Start the program by runing predicate \anoxia(Result).


:-['anoxiaKB.pl']. %consult our knowledge base

anoxia(Results) :-  %Predicate initiates all the program
	write('Are there lab data?(yes/no)'), %ask the user
	nl,
	read(Data), %Input data
  nl,
	(anoxia_labValues(Data, [Oxygen, NO3]) %data exists
  ; anoxia_noLabValues(Data,[Oligochaetes,Sediments, H2S, CH4,Substrate,Smell])),  %data don't exist
  %Search the kb for results
	bagof(Answer, rule(data(Data,[Oxygen,NO3,Oligochaetes,Sediments,H2S, CH4,Substrate,Smell]),Answer),  Results).

%predicate that is used when data exists:
anoxia_labValues(yes, [Oxygen, No3]) :-
	write('What is the percentage of Oxygen? (intiger number)'), %ask for the data
  nl,
	read(Oxygen),  %read the percentage of oxygen
  number(Oxygen), %make sure that user did not imput invalid data
  ( (Oxygen <20 , %if oxygen is less than 20%
    no3values(NO3) ) ;  %ask for NO3 data
  (Oxygen >= 20)).  % if oxygen is more than 20 we already arive at a leaf

%predicate that asks for input of NO3 data
no3values(NO3):-
  write('Is there a presence of NO3?(yes/no)'),
	nl,
  read(NO3),
  nl.



%predicate that is used when data does not exist
anoxia_noLabValues(no,[Oligochaetes,Sediments,H2S, CH4,Substrate,Smell]):-
  write('Are there red oligochaetes present? (yes/no/few)'),
  nl,
  read(Oligochaetes), %get oligochaetes input
  nl,(
      (
				Oligochaetes = few, ! %if oligochaetes is few, stop
			);
			(
				Oligochaetes = yes, ! %if oligochaetes exist, stop
			);(
      Oligochaetes = no, % if oligochaetes doesn't exist check for more
      write('Is there a presence of sediments? (dark/black/light)'),
      nl,
      read(Sediments), %get sediments input
      (
      (Sediments = black ; Sediments = dark),   % if sediments are dark/black
        write('Is H2S present? (yes/no)'),  %%check the H2S
        nl,
        read(H2S),
        ((H2S = yes), ! ;     % if H2S is present we arive at another leaf
        (H2S = no,            %if h2S is not present check further down the tree
        write('Is CH4 present? (yes/no)'),
        nl,
        read(CH4),    %get CH4 presence
        nl
        ))
      ;
      (
        Sediments = light,  %when sediment is light we have to check texture and smell
        write('What is the texture of the substrate?(big/middle/fine)'),
        nl,
        read(Substrate),
        nl,
        (
        (Substrate = big ; Substrate = middle), ! %%if texture is big or middle
        );      %%we arived at a leaf and stop
        (
        write('Does the water smell bad? (yes,no)'),  %%otherwise we check the Smells of the water
        nl,
        read(Smell),
        nl
        )
      )
      ))).
