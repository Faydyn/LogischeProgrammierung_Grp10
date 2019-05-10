/*
Adnan Alyousfi, 218205332, Informatik
Dirk Peglow, Informatik
Nils Henrik Seitz, 218205308, Informatik
Lorka Trad, Informatik
Nico Trebbin, 218204402, Informatik
*/

% Aufgabe 1

% 1.A
parent(walter,mirco).       %f-p1
parent(walter,jana).        %f-p2
parent(mirco,nele).         %f-p3
parent(silke,nele).         %f-p4
parent(mirco,willi).        %f-p5
parent(silke,filip).        %f-p6
parent(dorothea,dagmar).    %f-p7
parent(dagmar,silke).       %f-p8
parent(dagmar,jan).         %f-p9


female(dorothea).           %f-f1
female(dagmar).             %f-f2
female(jana).               %f-f3
female(silke).              %f-f4
female(nele).               %f-f5

male(walter).               %f-m1
male(mirco).                %f-m2
male(jan).                  %f-m3
male(filip).                %f-m4
male(willi).                %f-m5

  
% 1.B
% Helpdef. for brother, sister, aunt, uncle
sibling(X,Y) :- parent(A,X),parent(A,Y),X \== Y.    %r0

child(X,Y) :- parent(Y,X).                          %r1
daughter(X,Y) :- female(X),child(X,Y).              %r2
son(X,Y) :- male(X),child(X,Y).                     %r3
brother(X,Y) :- male(X),sibling(X,Y).               %r4
sister(X,Y) :- female(X),sibling(X,Y).              %r5
aunt(X,Y) :- parent(Z,Y),sister(X,Z).               %r6
uncle(X,Y) :- parent(Z,Y),brother(X,Z).             %r7
grandparent(X,Y) :- parent(X,Z),parent(Z,Y).        %r8

	
% 1.C
aufgabe1c :- forall(writeln(child(jana,walter)),child(jana,walter)) ;  forall(writeln(daughter(silke,dagmar)), daughter(silke,dagmar)); forall(writeln(son(mirco, walter)),son(mirco, walter)); forall(writeln(brother(mirco, jana)), brother(mirco, jana)); 
forall(writeln(sister(jana, mirco)), sister(jana, mirco)); forall(writeln(aunt(jana, nele)), aunt(jana, nele)); forall(writeln(uncle(jan, nele)), uncle(jan, nele)); forall(writeln(grandparent(walter, nele)), grandparent(walter, nele)).
% Alle Anfragen sollten den Wert true wiedergeben. Falsche Eingaben geben, außer die Angabe, kein true aus. z.B brother(mirco,mirco) gibt 'brother(mirco,mirco)' aus. brother(mirco,  jana) hingegen gibt 
%brother(mirco,  jana) 
%true. aus.


% Aufgabe 3

% 3.a

on(a,table).
on(b,a).
on(c,b).
on(d,table).
on(e,table).
on(f,e).


% 3.b

above(X,Y) :- on(Z,Y), Z == X.
above(X,Y) :- on(Z,Y), above(X,Z).
top(X) :- not(on(_,X)), on(X,_).
bottom(X) :- on(X,table).	%table als Block ausgeschlossen.
tower(X,Y) :- top(X), bottom(Y), above(X,Y). %table als Block ausgeschlossen.


% Aufgabe 4

% 4.b

sum(z,Y,Y).
sum(s(X),Y,s(Z)) :- sum(X,Y,Z).

prod(z,_,z).
prod(s(X),Y,Z) :-prod(X,Y,Z1), sum(Z1,Y,Z).


test41() :- prod(X,Y,Z),write('X = '),writeln(X),write('Y = '),writeln(Y),write('Z = '),writeln(Z).
test42() :- prod(s(s(z)),Y,Z),write('Y = '),writeln(Y),write('Z = '),writeln(Z).
test43() :- prod(X,Y,s(s(z))),write('X = '),writeln(X),write('Y = '),writeln(Y).


