insertSort([], []). 
insertSort([H|T], S) :-
        insertSort(T, S2),    
        insertItem(H, S2, S).
                
       
insertItem(X, S2, [X|S2]). 
insertItem(X, [NewH|T], [NewH|S]) :-
        NewH < X, 
        insertItem(X, T, S).
    

	