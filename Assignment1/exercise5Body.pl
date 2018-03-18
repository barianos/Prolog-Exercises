/*Write predicate, one_occurrence(L1, L2) which is true if each
element of list L1 occurs one in list L2. That is,
one_occurrence(L1, L2) removes double occurrences of elements
from list L1. Implement the predicate one_occurrence/2 with the
following techniques:
a)Structure construction in the head of clauses and
b) Structure construction in the body of clauses.
For the implementation of this predicate you can use the predicate
member/2.
For example, the answer to the query
“?- one_occurrence([a, b, a, a, b, c, d, c], L).”
is L= [a, b, c, d]. */

/* This solution will reply L= [a, b, d, c]. as it stars from the end*/

one_occurance([],[]). %%when input is an empty list, reply will also be an empty list
one_occurance([H|T],L2) :-
		M = [],
		one([H|T],M,L2).

one([],M,N):- append(M,M,N).
one([H|T],M,N):-
	one(T,M,NewN), %%M is a list of uniques
	member(H,NewN),	%%and if H is a member in the list we have nothing more to do
	append([],NewN,N).	%%so we just return the list as is and move to the next element

one([H|T],M,N):-
	one(T,M,NewN),  %%M is a list of uniques
	\+ member(H,NewN), %% and if H is not a member in the list
	append([H],NewN,N). %% we add it to the head of the list
