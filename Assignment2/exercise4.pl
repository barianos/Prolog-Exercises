%% make predicate student dynamic so we can change the knowledge base
:- dynamic student/2.
%%Facts
student(1, [m_markakis, ie, 2810379747,[ai,maths] ]).
student(2, [p_papadakis, ie, 2810379719,[ai,maths] ]).
student(3, [s_ioannou, ie, 2810379727,[ai,maths,progr] ]).
student(4, [v_fragou, ie, 2810379768,[ai,maths,physics] ]).

update_KB :-
  printer,
  read(X),
  decide(X).

%% decide/1 takes the input the user gave and decides what must be done
decide(X) :-
  X==1, %%change a record
  change_record.
decide(X):-
  X==2.
  %%Create a new record
decide(X):-
  X==3.
  %%Delete a record
decide(X) :-
  (X>3 ; X<1), %% exit the program
  write('You have chosen to exit! Bye bye!'), %% say bye-bye
  abort. %%close the programm


change_record :-
  write('Input student id for the record you wish to change'),
  nl,
  read(Sid),
  student(Sid,[Sname,Sschool,Sphone,Slessons]),
  write([Sid,Sname,Sschool,Sphone,Slessons]),
  nl,
  retract(student(Sid,[Sname,Sschool,Sphone,Slessons])),
  write('Input new student id'),
  nl,
  read(NewSid),
  write('Input new student name'),
  nl,
  read(NewSname),
  write('Input student school'),
  nl,
  read(NewSschool),
  write('Input new student phone'),
  nl,
  read(NewSphone),
  write('Input student lessons'),
  nl,
  read(NewSlessons),
  assert(student(NewSid,[NewSname,NewSschool,NewSphone, NewSlessons])).



%%printer/0 creates the Interface that guides the users through the options
printer :-
  write('-1 Change a record in the Knowledge Base'),
  nl,
  write('-2 Create a new record in the Knowledge Base'),
  nl,
  write('-3 Delete a record from the Knowledge Base'),
  nl,
  write('Any key to exit the program'),
  nl.
