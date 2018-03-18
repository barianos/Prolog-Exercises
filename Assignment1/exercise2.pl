/*Facts, the vertices as drawn on the graph */
vertex(a,b).
vertex(a,d).
vertex(b,c).
vertex(b,e).
vertex(c,d).
vertex(d,e).

/* Rule for connected*/
connected(A,B) :- vertex(A,B) ; vertex(A,X) , connected(X,B); A==B.
%% Here we use recursion to determine if there is a path from A to B\
%% we also use A==B to make connected(a,a) true
