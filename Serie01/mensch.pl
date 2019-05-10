parent(renate,mirco).
parent(walter,mirco).
parent(renate,jana).
parent(walter,jana).
parent(mirco,nils).
parent(silke,nils).
parent(mirco,nele).
parent(silke,nele).
parent(mirco,willi).
parent(silke,filip).
parent(silke,selma).
parent(dorothea,dagmar).
parent(dagmar,silke).
parent(rolf,silke).
parent(dagmar,jan).
parent(rolf,jan).
parent(dagmar,sven).
parent(rolf,sven).
female(dorothea).
female(dagmar).
female(renate).
female(jana).
female(silke).
female(nele).
female(selma).
male(walter).
male(rolf).
male(mirco).
male(jan).
male(sven).
male(nils).
male(filip).
male(willi).

child(X,Y) :- parent(Y,X).
daughter(X,Y) :- child(X,Y),female(X).
son(X,Y) :- child(X,Y),male(X).
siblings(X,Y) :- parent(Z,X),parent(Z,Y),parent(A,X),parent(A,Y),X \== Y,male(Z),female(A).
brother(X,Y) :- male(X),siblings(X,Y).
sister(X,Y) :- female(X),siblings(X,Y).
aunt(X,Y) :- female(X),siblings(X,Z),parent(Z,Y).
uncle(X,Y) :- male(X),siblings(X,Z),parent(Z,Y).
greatparent(X,Y) :- parent(X,Z),parent(Z,Y).


predecessor(X,Y) :-
    parent(X,Y).
predecessor(X,Y) :-
    parent(X,Z),
    predecessor(Z,Y).