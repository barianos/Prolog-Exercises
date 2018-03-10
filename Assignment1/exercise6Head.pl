max_element([],0).
max_element([H|T],L):-
	max_element(T,N),
	H > N,
	L is H.
max_element([H|T],L):-
	max_element(T,N),
	H < N,
	L is N.
