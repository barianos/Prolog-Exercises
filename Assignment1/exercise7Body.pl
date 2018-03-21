/*
Write predicate occurrences(L, X, N) which is true if Ν is the cardinality of the element
Χ in list L. Implement the predicate occurrences/3 with the following techniques:

b) Structure construction in the body of clauses.
*/

/*
Example query:
occurences([1,2,3,2],2,2).
answer: true
*/
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
