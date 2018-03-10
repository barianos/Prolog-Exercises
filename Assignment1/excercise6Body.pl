max_element([],0).
max_element([H|T], L):-
	M = 0,
	me([H|T],M, L ).

me([],M,0).
me([H|T], M,N):-
	me(T,M,NewN),
	H > NewN,
	N is H.
me([H|T], M,N):-
	me(T,M,NewN),
	H < NewN,
	N is NewN.
	
