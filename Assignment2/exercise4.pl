%% make predicates student, max_student_id and students dynamic
%% so we can change the knowledge base
:- dynamic max_student_id/1, students/1, student/2.
max_student_id(4).
students([1,2,3,4]).
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
  X==2,
  create_record.%%Create a new record
decide(X):-
  X==3,  %%Delete a record
  delete_record.
decide(X) :-
  (X>3 ; X<1), %% exit the program
  write('You have chosen to exit! Bye bye!'), %% say bye-bye
  abort. %%close the programm

%% Deletes a student from the records
delete_record :-
  write('Input student id for the record you wish to change'),
  nl,
  read(Sid),
  retract(student(Sid,_)),
  update_indicators.

%%Creates a new student in the record
create_record :-
  input_data(NewSname,NewSschool, NewSphone, NewSlessons),
  max_student_id(Mid),
  NewSid is Mid+1,
  assertz(student(NewSid,[NewSname,NewSschool,NewSphone, NewSlessons])),
  update_indicators,
  write('The identidier is '),
  write(NewSid),
  nl.


%%changes the records of a student
change_record :-
  write('Input student id for the record you wish to change'),
  nl,
  read(Sid),
  student(Sid,[Sname,Sschool,Sphone,Slessons]),
  write([Sid,Sname,Sschool,Sphone,Slessons]),
  nl,
  retract(student(Sid,[Sname,Sschool,Sphone,Slessons])),
  input_data(Name,School,Phone,Lessons),
  assertz(student(Sid,[Name,School,Phone, Lessons])),
  write('Update Sucessfull!'),
  nl.

%%updates predicates used as indicators
update_indicators:-
  retract(students(_)),
  findall(Id,student(Id,_),Bag),
  assertz(students(Bag)),
  max_element(Bag,M),
  retract(max_student_id(_)),
  assertz(max_student_id(M)).



%% Handles UI
input_data(NewSname,NewSschool, NewSphone, NewSlessons):-
  write('Input student name'),
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
  nl.


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



%%returns the max element of a list, usefull for our student_max_id/1 predicate
max_element([],0).
max_element([H|T],L):-
  	max_element(T,N),
  	H > N,
  	L is H.
max_element([H|T],L):-
  	max_element(T,N),
  	H < N,
  	L is N.
