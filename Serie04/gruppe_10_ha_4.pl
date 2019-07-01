/*
Adnan Alyousfi, 218205332, Informatik
Dirk Peglow, Informatik
Nils Seitz, 218205308, Informatik
Lorka Trad, Informatik
Nico Trebbin, 218204402, Informatik
*/

%Aufgabe 1 

next(g1, a, b).
next(g1, a, c).
next(g1, b, e).
next(g1, c, s(c)).
next(g1, s(C), s(s(C))).
next(g1, c, d).
next(g1, d, a).
next(g1, d, e).

path(G, S, Z, P) :- path(G, S, Z, [], P).
path(G, S, Z, _, [S, Z]) :- next(G, S, Z).
path(G, S, Z, V, [S|P]) :- next(G, S, T), \+ member(T, V), path(G, T, Z, [S|V], P).

/*
----
1.a|
----
2 Wege: [a,b,e] und [a,c,d,e]

----
1.b|
----
1 Lösung: [a,b,e], danach Endlosschleife

Da Prolog mittels Tiefensuche arbeitet, geht er aufgrund von next(g1, s(C), s(s(C))). in eine Endlosschleife. Mittels next(g1, c, s(c)). geht man in den Teufelskreis rein. Path versucht danach, den
Nachfolger von s(c) herauszufinden. Nach next(g1, s(C), s(s(C))). ist der Nachfolger von s(c) s(s(c)). Nun guckt das Programm, ob s(s(c)) mit a verknüpft ist. Dies stimmt nicht und das Programm failt.
Nun geht er wieder zu next(g1, s(C), s(s(C))). mit C = s(s(c)). Man sieht schnell, da C eine Variable ist führ dies in eine Endlosschleife.
*/

%Aufgabe 2


prove(true) :- !.
prove(member(E, L)) :- !, member(E, L). % noetig, weil member built-in ist

%2.a
%*************************************
prove(\+ Goal1) :- !, \+ prove(Goal1).%******
%*************************************

prove((Goal1, Goal2)) :- !, prove(Goal1), prove(Goal2).
prove(Goal) :- clause(Goal, Body), prove(Body).


%2.b
prove_b(Goal) :- prove_b_akk(Goal, 0).

prove_b_akk(true, A) :- !.
prove_b_akk(member(E, L),A) :- !, write(A), write(' NAF: '), writeln(member(E, L)),  member(E, L). % noetig, weil member built-in ist

prove_b_akk(\+ Goal1, A) :- !, A1 is A, write(A), write(' try rule: '), writeln(\+ Goal1), \+ prove_b_akk(Goal1, A). 

prove_b_akk((Goal1, Goal2), A) :- !, write(A), write(' goals: '), write(Goal1), write(','), writeln(Goal2), prove_b_akk(Goal1, A), prove_b_akk(Goal2, A).
prove_b_akk(Goal, A) :- clause(Goal, Body), A1 is A+1, write(A), write(' try rule: '), write(Goal), write(' -> '), writeln(Body), prove_b_akk(Body, A1).


%2.c
prove(Max, Max, _) :- fail.
prove(Max, Tiefe, _) :- Tiefe > Max,!,  fail.
prove(_, _, true) :- !.
prove(_, _, member(E, L)) :- !, member(E, L). % noetig, weil member built-in ist
prove(Max, Tiefe, \+ Goal1) :- !, Tiefe1 is Tiefe + 1, \+ prove(Max, Tiefe1, Goal1).
prove(Max, Tiefe, (Goal1, Goal2)) :- !, Tiefe1 is Tiefe + 1,  prove(Max, Tiefe1, Goal1), prove(Max, Tiefe1, Goal2).
prove(Max, Tiefe, Goal) :- clause(Goal, Body), prove(Max, Tiefe, Body).
%Man findet nun 2 Lösungen. Es entsteht nun auch keine Endlosschleife mehr.

/*
prove(true) :- !,
write('proven.'),
nl.
prove((A,B)) :- !,
write('goal: '),
write((A,B)),nl,
prove(A),
prove(B).
prove(A) :-
write('goal: '),
write(A),nl,
clause(A,B),
prove(B).
*/
%Aufgabe 3

%3.a
next(kannibalen, s(MN, KN, MS, KS, nord), s(MN2, KN2, MS2, KS2, sued)) :-
	between(0,MN,M), between(0,KN,K), 
	MN =< 3, KN =< 3, MS =< 3, KS =< 3,
	M+K =< 3, M+K >= 1,
	KS2 is KS + K, KN2 is KN - K,
	MS2 is MS + M, MN2 is MN - M,  
	(MN2 >= KN2;MN2 = 0),
	(MS2 >= KS2; MS2 = 0).
	
	
next(kannibalen, s(MN, KN, MS, KS, sued), s(MN2, KN2, MS2, KS2, nord)) :-
	between(0,MS,M), between(0,KS,K), 
	MN =< 3, KN =< 3, MS =< 3, KS =< 3,
	M+K =< 3, M+K >= 1,
	KS2 is KS - K, KN2 is KN + K,
	MS2 is MS - M, MN2 is MN + M,  
	(MN2 >= KN2;MN2 = 0),
	(MS2 >= KS2; MS2 = 0).
	
%path(kannibalen, s(3,3,0,0,nord), s(0,0,3,3,sued),X).

%3.b
next(kannibalen(BootKap), s(MN, KN, MS, KS, nord), s(MN2, KN2, MS2, KS2, sued)) :-
	between(0,MN,M), between(0,KN,K),  
	M+K =< BootKap, M+K >= 1,
	KS2 is KS + K, KN2 is KN - K,
	MS2 is MS + M, MN2 is MN - M,  
	(MN2 >= KN2;MN2 = 0),
	(MS2 >= KS2; MS2 = 0).
	
	
next(kannibalen(BootKap), s(MN, KN, MS, KS, sued), s(MN2, KN2, MS2, KS2, nord)) :-
	between(0,MS,M), between(0,KS,K), 
	M+K =< BootKap, M+K >= 1,
	KS2 is KS - K, KN2 is KN + K,
	MS2 is MS - M, MN2 is MN + M,  
	(MN2 >= KN2;MN2 = 0),
	(MS2 >= KS2; MS2 = 0).
	
%da man die Zustände nicht einzeln bearbeiten darf, entstehen viele unnötige Lösungen. Also Lösungen, bei denen er mehrfach ins Ziel und wieder zurück geht.
	
connected(A, B, C, D) :- 
	findall(X, path(A,B,C,X), E1), sort(E1, Esort), bagof(_, member(D,Esort),_). %das gleiche wie Path, Dopplungen wurden jedoch entfernt.
	
/*	path(kannibalen(3), s(4,4,0,0,nord), s(0,0,4,4,sued),X). bzw connected(kannibalen(3), s(4,4,0,0,nord), s(0,0,4,4,sued), P).
	
	[s(4, 4, 0, 0, nord), s(4, 2, 0, 2, sued), s(4, 3, 0, 1, nord), s(4, 1, 0, 3, sued), s(4, 2, 0, 2, nord), s(4, 0, 0, 4, sued), s(4, 1, 0, 3, nord), s(1, 1, 3, 3, sued), 
	s(2, 2, 2, 2, nord), s(0, 2, 4, 2, sued), s(0, 3, 4, 1, nord), s(0, 0, 4, 4, sued)]
	uvm. 

*/