one_occurance([],[]).
one_occurance([H|T],L2) :- 
		M = [],
		one([H|T],M,L2).

one([],M,N):- append(M,M,N).
one([H|T],M,N):-
	one(T,M,NewN),
	member(H,NewN),
	append([],NewN,N).
	
one([H|T],M,N):-
	one(T,M,NewN),
	\+ member(H,NewN),
	append([H],NewN,N).