:-[kb_old]. %%Consult the Knowledge Base

createnewKB :-  %%Predicate to construct a new file with the KB
  importKB.     %%import the predicates from the KB

importKB :-   %%Predicate to make use of the KB
  clause(max_student_id(Y),_),  %%find the number of students in the KB
  clause(students(List),_),     %%find the ids of the students in the KB
  loop(Y,List).                 %%Run a loop to construct the KB


loop(Size,[H|T]) :-  %%Predicate to construct the student predicates for the KB
  Size >= 1,      %%As long as the itterator is larger or equal to 1
  clause(student(H,DataList),true), %%Find the student in the KB
  NextSize is Size-1, %%Increse the itterator
  loop(NextSize,T).   %%recursively run the predicate

loop(Size,_) :-   %%Predicate to 'escape' when all students are found
  Size < 1,   %%When the itterator has reached 0
  save_to_file. %%save the current state of the program to a new KB

save_KB :-   %%Predicate that saves the programm to a new file
  tell('kb.pl'),
  listing(max_student_id),      %%write the current state of this program to the new files
  listing(students),
  listing(student),
  told.         %%close the new file
