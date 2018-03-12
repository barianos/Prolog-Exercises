occurrences([],_,0).
occurrences([H|T],X,N) :-
	M = 0,
	oz([H|T], X , M, NewN),
	N is NewN.
	
oz([],X,M,0).
	
oz([H|T], X , M, N):-
	oz(T,X, M, NewN),
	H == X,
	N is NewN+1.
	
	
oz([H|T], X , M, N):-
	oz(T,X, M, N),
	H =\= X.
