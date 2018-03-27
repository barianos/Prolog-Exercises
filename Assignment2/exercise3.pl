%% a predicate that will read the contents of the old knowledge base
%% and will write them in a new file
createnewKB:-
  see('kb_old.pl'), %% the file we read from
  read(X),  %%read the first part
  tell('kb_new.pl'), %%the file we write to
  write(X), %%write to the file
  (\+(X = end_of_file)-> createnewKB ; told, seen). %%if the stream is not at the
  %%end of the file we repeat, otherwise we close the two files.
