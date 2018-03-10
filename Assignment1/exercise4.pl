unique(0,[]).
unique(St,[H|T]):- 
		St == H , 
		\+ member(St,T).
unique(St,[H|T]):-
		St=\= H ,
		unique(St,T).

 