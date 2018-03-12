occurrences([],_,0).
occurrences([H|T],X,N) :-
	X == H,
	occurrences(T, X , M),
	N is M+1.
occurrences([H|T],X,N) :-
	X =\= H ,
	occurrences(T, X, N).   