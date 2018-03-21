/*
Write predicate maxElement(L, Max) with mode(?,+)which is true if the element Max is
the maximum element from the elements of the list L. You can assume that the elements
of list L are integers. Implement the predicate maxElement/2 with the following
techniques: a) Structure construction in the head of clauses and b) Structure construction
in the body of clauses.Write predicate maxElement(L, Max) with mode(?,+)which is true if the element Max is
the maximum element from the elements of the list L. You can assume that the elements
of list L are integers. Implement the predicate maxElement/2 with the following
techniques:

a) Structure construction in the head of clauses
*/
/*
Example query:
max_element([1,5,3,7,2,6], L).
L= 7

*/

max_element([],0).
max_element([H|T],L):-
	max_element(T,N),
	H > N,
	L is H.
max_element([H|T],L):-
	max_element(T,N),
	H < N,
	L is N.
