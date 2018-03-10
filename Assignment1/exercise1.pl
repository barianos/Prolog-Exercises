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

father(X,Y) :- parent(X,Y), male(X).
mother(X,Y) :- parent(X,Y), female(X).
grandfather(X,Y) :- parent(X,Z), parent(Z,Y), male(X).
grandmother(X,Y) :- parent(X,Z), parent(Z,Y), female(X).
sister(X,Y) :- parent(Z,X), parent(Z,Y), female(X).
brother(X,Y) :- parent(Z,X), parent(Z,Y), male(X).
descendant(X,Y) :- parent(Y,X) ; (parent(Z,X),parent(Y,Z)).
ancestor(X,Y) :- parent(X,Y) ; (parent(X,Z),parent(Z,Y)).