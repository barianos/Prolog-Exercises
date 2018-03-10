vertex(a,b).
vertex(a,d).
vertex(b,c).
vertex(b,e).
vertex(c,d).
vertex(d,e).


connected(A,B) :- vertex(A,B) ; vertex(A,X) , connected(X,B); A=B.