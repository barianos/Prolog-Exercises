/*
Write predicate unique(St, L) which returns true if the element St appears only once in
the list L. You can use the predicate member(St, L) which returns true if the element St
exists in the list L.*/

unique(St,[H|T]):-
		St == H , %%This is true when we have reached the number in the list
		\+ member(St,T). %%member/2 returns true if St is a member of list T
unique(St,[H|T]):-
		St=\= H , 	%%this means we have not reached the number in the list
		unique(St,T). %% so we keep searching
