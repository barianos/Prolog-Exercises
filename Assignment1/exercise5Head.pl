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

one_occurrence([],[]). %%when input is an empty list, reply will also be an empty list
one_occurrence([H|T],L2):-
		one_occurrence(T,M), %%M is a list of uniques
		member(H,M), %%if H is a member in M we move to the next element
		append([],M,L2).
one_occurrence([H|T], L2):-
		one_occurrence(T,M), %%M is a list of uniques
		\+member(H,M),		%% if H is not a member in M
		append([H],M,L2). %% we add it to the list and move to the next element
