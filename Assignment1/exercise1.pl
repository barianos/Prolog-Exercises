/*Facts*/
parent(panos, john).
parent(elene, john).
parent(aris, ann).
parent(mary1, ann).
parent(john, mary2).
parent(john, kostas).
parent(john, manolis).
parent(ann, mary2).
parent(ann, kostas).
parent(ann, manolis).
male(john).
male(kostas).
male(manolis).
male(panos).
male(aris).
female(mary1).
female(mary2).
female(ann).
female(elene).

/*Rules*/
father(X,Y) :- parent(X,Y), male(X).
%% X is father of Y if X is a parent of Y and a male
mother(X,Y) :- parent(X,Y), female(X).
%% X is mother of Y if X is a parent of Y and a female
grandfather(X,Y) :- parent(X,Z), parent(Z,Y), male(X).
%%X is grandfather of Y if X is parent to a parent of Y and X is a male
grandmother(X,Y) :- parent(X,Z), parent(Z,Y), female(X).
%% X is grandmother of Y if X is parent to a parent of Y and X is a female
sister(X,Y) :- parent(Z,X), parent(Z,Y), female(X).
%% X is sister of Y, if X and Y have a parent in common and X is a female
brother(X,Y) :- parent(Z,X), parent(Z,Y), male(X).
%% X is brother of Y, if X and Y have a parent in common and X is a male
descendant(X,Y) :- parent(Y,X) ; (parent(Z,X),parent(Y,Z)).
%% X is a descendant of Y if Y is parent of X, or if Y is a parent of aparent of X
ancestor(X,Y) :- parent(X,Y) ; (parent(X,Z),parent(Z,Y)).
%% X is an ancestor of Y if X is a parent of Y or if X is a parent of a parent of Y
