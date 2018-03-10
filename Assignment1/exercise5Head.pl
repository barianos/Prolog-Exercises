one_occurrence([],[]).
one_occurrence([H|T],L2):- 
		one_occurrence(T,M), 
		member(H,M), 
		append([],M,L2).
one_occurrence([H|T], L2):-
		one_occurrence(T,M),
		\+member(H,M),
		append([H],M,L2).
