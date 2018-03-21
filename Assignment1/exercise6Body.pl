/*
Write predicate maxElement(L, Max) with mode(?,+)which is true if the element Max is
the maximum element from the elements of the list L. You can assume that the elements
of list L are integers. Implement the predicate maxElement/2 with the following
techniques: a) Structure construction in the head of clauses and b) Structure construction
in the body of clauses.Write predicate maxElement(L, Max) with mode(?,+)which is true if the element Max is
the maximum element from the elements of the list L. You can assume that the elements
of list L are integers. Implement the predicate maxElement/2 with the following
techniques:

b) Structure construction in the body of clauses.
*/
/*
Example query:
max_element([1,5,3,7,2,6], L).
L= 7

*/
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
