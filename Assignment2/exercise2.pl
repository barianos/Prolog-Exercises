%%Facts
kb('Yannis', likes, maths).
kb('Yannis', likes, physics).
kb('Yannis', plays, voleyball).
kb('Yannis', plays, chess).
kb('Yannis', plays, basketball).
kb('Maria' ,likes, maths).
kb('Maria', likes, geography).
kb('Maria', plays, chess).
kb('Maria', plays, tennis).
kb('Eleni', likes, physics).
kb('Eleni', likes, informatics).
kb('Eleni',plays,voleyball).
kb('Eleni',plays,tennis).


%%Rules
%%collect_results/0 gives the use a number of options,
%% and then returns the result depending on the users choise
collect_results:-
  printer, %% a predicate that will display the options the user has
  read(X), %% read the input from the user
  decide(X). %% handle the result

%% decide/1 takes the input the user gave and decides what it has to do
decide(X):-
    X==1,
    write('Input a name'),
    nl,
    read(Y),
    handle_name(Y,L),
    write(L),
    nl.
decide(X):-
    X==2,
    write('Input a lesson'),
    nl,
    read(Y),
    handle_lesson(Y,L),
    write(L),
    nl.
decide(X):-
    X==3,
    write('Input a game'),
    nl,
    read(Y),
    handle_game(Y,L),
    write(L),
    nl.
decide(X):-
    X==4,
    write('Input likes for lessons or plays for games'),
    nl,
    read(Y),
    handle_verb(Y,L),
    write(L),
    nl.
decide(X):-
    X==5, %% the user has chosen to close the programm
    write('You have chosen to exit! Bye bye!'), %% say bye-bye
    abort. %%close the programm
decide(X):-
    (X>5 ; X<1), %% invalid input
    write('Incorect Input'), %% inform the user of the problem
    nl,
    collect_results. %% and restart the logic

%% handle_name/2 finds all interests of the person(Y)
%%and returns them in a list(L)
handle_name(Y,L):-
  %findall(Care,kb(Y,_,Care), Bag),
  bagof(Care,kb(Y,_,Care), Bag),
  append([],Bag,L).

%%handle_lesson/2 finds all the persons that likes a lesson (Y)
%%and returns them in a list(L)
handle_lesson(Y,L):-
  %findall(Care,kb(Care,likes,Y), Bag),
  bagof(Care,kb(Care,likes,Y), Bag),
  append([],Bag,L).

%%handle_game/2 finds all the persons that plays a game(Y)
%% and returns them in a list(L)
handle_game(Y,L):-
  bagof(X,kb(X,plays,Y), Bag),
  append([],Bag,L).

%%handle_verb/2 Finds all the subjects (persons) and objects(games and lessons)
%%that are related through the verb(Y) and returns them in a list(L)
handle_verb(Y, L):-
  %findall(Name,kb(Name,Y,_), Bag),
  %findall(Int,kb(_, Y, Int),Bag2),
  bagof(Name,kb(Name,Y,_), Bag),
  bagof(Int,kb(_, Y, Int),Bag2),
  append(Bag,Bag2,L).

%%printer/0 creates the Interface that guides the users through the options
printer:-
  write('input a number from the selection bellow'),
  nl,
  write('1 - Input a name and learn the courses and games the person likes'),
  nl,
  write('2 - Input a lesson and learn the names of students who like it.'),
  nl,
  write('3 - Input a game and learn the names of students who play it.'),
  nl,
  write('4 - Input a verb from the bellow:'),
  nl,
  write('    -like to learn students preferences in lessons'),
  nl,
  write('    -plays to learn students preferences in games'),
  nl,
  write('5 - Exit the program'),
  nl.
