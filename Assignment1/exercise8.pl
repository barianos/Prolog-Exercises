/*
Write predicate insertionSort(L, S) which is true if list S is list L with its elements sorted
in ascending order using the insertion sort algorithm. Note, the insertion sort algorithm
initially inserts the first element so you have a sorted list from one element. Then, it
inserts each next element in the appropriate place keeping the list sorted.
*/

/*
Example query: insertionSort([1,3,2,4,6,5],L).
L = [1,2,3,4,5,6]
*/
insertionSort([], []).
insertionSort([H|T], L):-
        insertionSort(T, M),
        insert(H, M, L).

insert(X, [], [X]).
insert(X, [H|T], [X|L]):-
              X =< H,
              insert(H, T, L).
insert(X, [H|T], [H|L]):-
              X > H,
              insert(X, T, L).
