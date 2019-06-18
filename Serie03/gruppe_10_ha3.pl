/*
Adnan Alyousfi, 218205332, Informatik
Dirk Peglow, Informatik
Nils Seitz, 218205308, Informatik
Lorka Trad, Informatik
Nico Trebbin, 218204402, Informatik
*/

%Aufgabe 1 
blup(L, E, R) :- append(L1, [E|L2], L), append(L1, L2, R).

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
simplify(-(-(E)), E) :- !.
simplify(-(E+F),(-E)+(-F)):- !.
simplify(-(E*F), (-E)*F):- !.
simplify(0+E,E):- !.
simplify(E+0,E):- !.
simplify(0*_, 0):- !.
simplify(_*0, 0):- !.
simplify(1*E, E):- !.
simplify(E*1, E):- !.
simplify((E/1),E):- !.
simplify(E-0, E):- !.
simplify(E-E, 0):- !.



%Identifikationsregel
simplify(E*Variable + F,E*Variable + F) :- not(number(Variable)), atom(Variable), number(E), number(F),!.
simplify(E*Variable - F,E*Variable - F) :- not(number(Variable)), atom(Variable),number(E), number(F),!.

simplify(E,E) :- atom(E), !;number(E), !.
simplify(E*Variable,E*Variable) :- number(E), atom(Variable), not(number(Variable)), !.


%-dfvad
simplify(Konst+Variable, Konst+Variable):- number(Konst), atom(Variable), not(number(Variable)), !.
simplify(Variable+Konst, Konst+Variable):-number(Konst), atom(Variable), not(number(Variable)), !.
simplify(Konst-Variable, Konst-Variable):- number(Konst), atom(Variable), not(number(Variable)), !.
simplify(Variable-Konst, -Konst+Variable):-number(Konst), atom(Variable), not(number(Variable)), !.
simplify(Konst*Variable, Konst*Variable):- number(Konst), atom(Variable), not(number(Variable)), !.
simplify(Variable*Konst, Konst*Variable):-number(Konst), atom(Variable), not(number(Variable)), !.

simplify(Term1 + Term2, X) :-simplify(Term1,A), simplify(Term2,B), number(A), number(B), X is A + B,  !.
simplify(Term1 - Term2, X) :- simplify(Term1,A), simplify(Term2,B), number(A), number(B), X is A - B,  !.
simplify(Term1 * Term2, X) :- simplify(Term1,A), simplify(Term2,B), number(A), number(B), X is A * B, !.
simplify(Term1 / Term2, X) :- simplify(Term1,A), simplify(Term2,B), number(A), number(B), X is A / B, !.





%spezielle Regeln

simplify(E*Variable + F*Variable, X*Variable) :- number(E), number(F), atom(Variable), simplify(E+F,X), !.
simplify(Variable*E + F*Variable, X*Variable) :- number(E), number(F), atom(Variable), simplify(E+F,X), !.
simplify(E*Variable + Variable*F, X*Variable) :- number(E), number(F), atom(Variable), simplify(E+F,X), !.
simplify(Variable*E + Variable*F, X*Variable) :- number(E), number(F), atom(Variable), simplify(E+F,X), !.


simplify(E*Variable-F*Variable,X*Variable) :- simplify(E-F,X), !.
simplify(E*Variable/(F*Variable), X) :- simplify(E/F,X), !.

simplify(E*Variable1 + F*Variable2, X) :- simplify(E,A), simplify(F,B), X = A*Variable1+B*Variable2, !.
simplify(E*Variable1-F*Variable2,X) :- simplify(E,A), simplify(F,B), X = A*Variable1-B*Variable2, !.
simplify(E*Variable1*F*Variable2, X) :- simplify(E,A), simplify(F,B), Y is A * B, X = Y * Variable1*Variable2, !.
simplify(E*Variable1/(F*Variable2), X) :- simplify(E,A), simplify(F,B), Y is A / B, X = Y * Variable1/Variable2, !.


simplify(E*Variable + Variable, X*Variable) :- simplify(E + 1,X), !.
simplify(E*Variable - Variable,X*Variable) :- simplify(E - 1,X), !.
simplify(E*Variable/Variable, E) :- !.

simplify(Variable + F*Variable, X*Variable) :- simplify(F + 1,X), !.
simplify(Variable - F*Variable,X*Variable) :- simplify(- F + 1,X), !.
simplify(Variable/(F*Variable), 1/F) :- !.


simplify(Variable + Variable, 2*Variable) :- !.
simplify(Variable - Variable, 0):- !.
simplify(Variable / Variable, 1):- !.
simplify(Variable*Variable,Variable*Variable ):- !.

%allgmeine Regeln

simplify(Term1 + Term2, X) :-simplify(Term1,A), simplify(Term2,B), Y = A + B, simplify(Y,X),  !.
simplify(Term1 - Term2, X) :- simplify(Term1,A), simplify(Term2,B), Y = A - B,  simplify(Y,X), !.
simplify(Term1 * Term2, X) :- simplify(Term1,A), simplify(Term2,B), Y = A * B, simplify(Y,X), !.


/*
simplify(E+F, X) :- simplify(E,A), simplify(F,B), X is A + B, !.
simplify(E-F,X) :-   simplify(E,A), simplify(F,B), X is A - B, !.
simplify(E*F, X) :- simplify(E,A), simplify(F,B), X is A * B, !.
simplify(E/F, X) :- simplify(E,A), simplify(F,B), X is A / B, !.
*/







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









% Serie 2 - Aufgabe 2

% 2.A

%ableitung(Funktion,Variable,Ableitung).

% i.
ableitung(Variable,Variable,1) :- !.

% ii.
ableitung(C, Variable, 0) :-  atomic(C), Variable \== C,!.

%iii.
ableitung(Factor*Variable,Variable,Factor) :- atomic(Factor), Factor \== Variable,!.
ableitung(Factor*v +C,Variable,Factor) :- atomic(C), C \== Variable, atomic(Factor), Factor \== Variable,!.

%iv
ableitung(Function1+Function2,X,Derivative) :- ableitung(Function1,X,Y1), ableitung(Function2,X,Y2), Derivative = Y1+Y2,!. 

%v
ableitung(Function1*Function2,X,Derivative) :- ableitung(Function1,X,Y1), ableitung(Function2,X,Y2), Derivative = (Y1*Function2 + Function1*Y2),!.

%vi
ableitung(Function1/Function2,X,Derivative)  :- ableitung(Function1,X,Y1), ableitung(Function2,X,Y2), Derivative = ((Y1*Function2 - Function1*Y2)/(Function2*Function2)),!.

%Aufgabe 3
aufgabe3 :- ableitung(3*x+2, x, A), simplify(A,Z1), writeln('ableitung(3*x+2, x, R)'), write('R =   '), writeln(A), write('simplify('),write(A),writeln(', Z)'), write('Z = '), writeln(Z1), writeln(''), 
ableitung(3*x*x, x, B), simplify(B,Z2), writeln('ableitung(3*x*x, x, R)'), write('R =  '),writeln(B),write('simplify('),write(B),writeln(', Z)'), write('Z = '), writeln(Z2),writeln(''), 
ableitung(y,x,C), simplify(C,Z3), writeln('ableitung(y,x,R)'), write('R =  '),writeln(C), write('simplify('),write(C),writeln(', Z)'), write('Z = '), writeln(Z3), writeln(''),
ableitung((3*x+2)*(2*x), x, D), simplify(D,Z4), writeln('ableitung((3*x+2)*(2*x), x, R)'),write('R =  '),writeln(D), write('simplify('),write(D),writeln(', Z)'), write('Z = '), writeln(Z4), writeln(''),
ableitung((x*x+2*x+3)/(3*x), x, E), simplify(E,Z5), writeln('ableitung((x*x+2*x+3)/(3*x), x, R)'),write('R =  '),writeln(E),write('simplify('),write(E),writeln(', Z)'), write('Z = '), writeln(Z5), writeln('').

