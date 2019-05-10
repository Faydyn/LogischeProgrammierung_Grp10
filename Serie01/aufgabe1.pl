/*
Nico Trebbin, 218204402, Informatik
Nils Henrik Seitz, 218205308, Informatik
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
