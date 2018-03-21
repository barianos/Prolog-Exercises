/*
Write predicate occurrences(L, X, N) which is true if Ν is the cardinality of the element
Χ in list L. Implement the predicate occurrences/3 with the following techniques:

a) Structure construction in the head of clauses and 
*/

/*
Example query:
occurences([1,2,3,2],2,2).
answer: true
*/

occurrences([],_,0).
occurrences([H|T],X,N) :-
	X == H,
	occurrences(T, X , M),
	N is M+1.
occurrences([H|T],X,N) :-
	X =\= H ,
	occurrences(T, X, N).
