/*
Adnan Alyousfi, 218205332, Informatik
Dirk Peglow, Informatik
Nils Seitz, 218205308, Informatik
Lorka Trad, Informatik
Nico Trebbin, 218204402, Informatik
*/

%Aufgabe 1 
blup(L, E, R) :- append1(L1, [E|L2], L), append1(L1, L2, R).

%1.B
blup2([A|L],E,[A|R])  :- blup2(L,E,R).
blup2([E],E,[]) :-  !.
blup2([E|L],E,R) :- blup3(L, R).
%blup2([],null,[]).

blup3([A|L],[A|R]) :- blup3(L,R).
blup3([],[]).


append1([], L, L).
append1([H|T], L, [H|R]) :- append1(T, L, R).


%Aufgabe 2
%Basisregeln
simplify(-(-E), E) :- !.
simplify(-(E+F),(-E)+(-F)):- !.
simplify(-(E*F), (-E)*F):- !.
simplify(0+E,E):- !.
simplify(E+0,E):- !.
simplify(0*_, 0):- !.
simplify(_*0, 0):- !.
simplify(1*E, E):- number(E), !.
simplify(E*1, E):- number(E), !.
simplify((E/1),E):- !.
simplify(E-0, E):- !.
simplify(E-E, 0):- !.

%komplexe Regeln


simplify(E*Variable + F*Variable, X*Variable) :- simplify(E,A), simplify(F,B), X is A + B, !.
simplify(E*Variable-F*Variable,X*Variable) :- simplify(E,A), simplify(F,B), X is A - B, !.
simplify(E*Variable/(F*Variable), X) :- simplify(E,A), simplify(F,B), X is A / B, !.

simplify(E*Variable1 + F*Variable2, X) :- simplify(E,A), simplify(F,B), X = A*Variable1+B*Variable2, !.
simplify(E*Variable1-F*Variable2,X) :- simplify(E,A), simplify(F,B), X = A*Variable1-B*Variable2, !.
simplify(E*Variable1*F*Variable2, X) :- simplify(E,A), simplify(F,B), Y is A * B, X = Y * Variable1*Variable2, !.
simplify(E*Variable1/(F*Variable2), X) :- simplify(E,A), simplify(F,B), Y is A / B, X = Y * Variable1/Variable2, !.

simplify(E*Variable + F*Variable, X*Variable) :- simplify(E,A), simplify(F,B), X is A + B, !.
simplify(E*Variable-F*Variable,X*Variable) :- simplify(E,A), simplify(F,B), X is A - B, !.
simplify(E*Variable/(F*Variable), X) :- simplify(E,A), simplify(F,B), X is A / B, !.

simplify(Variable + Variable, 2*Variable) :- !.
simplify(Variable - Variable, 0):- !.
simplify(Variable / Variable, 1):- !.
simplify(Variable * Variable, Variable * Variable):- !.

simplify(E*Variable,E*Variable) :- atom(E) ; number(E).

simplify(E+F, X) :- simplify(E,A), simplify(F,B), X is A + B, !.
simplify(E-F,X) :-  simplify(E,A), simplify(F,B), X is A - B, !.
simplify(E*F, X) :- simplify(E,A), simplify(F,B), X is A * B, !.
simplify(E/F, X) :- simplify(E,A), simplify(F,B), X is A / B, !.

%Identifikationsregel
simplify(E,E) :- atom(E) ; number(E).
%simplify(Variable, Variable) :- atom(Variable); string(Variable).



%4

border(hro,lro).
border(lro,vr).
border(lro,mse).
border(lro,lup).
border(lro,nwm).
border(vr,vg).
border(vr,mse).
border(vg,mse).
border(mse,lup).
border(sn,lup).
border(sn,nwm).
border(lup,nwm).
