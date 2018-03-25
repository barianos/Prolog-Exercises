createnewKB:-
  see('kb_old.pl'),
  read(X),
  tell('kb_new.pl'),
  write(X),
  (\+(X = end_of_file)-> createnewKB ; told, seen).
