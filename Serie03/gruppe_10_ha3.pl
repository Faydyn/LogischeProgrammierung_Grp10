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

blup3([A|L],[A|R]) :- blup3(L,R).
blup3([],[]).


%Aufgabe 2

%Identifikationsregel
simplify(E*Variable + F,E*Variable + F) :- not(number(Variable)), atom(Variable), number(E), number(F),!.
simplify(E*Variable - F,E*Variable - F) :- not(number(Variable)), atom(Variable),number(E), number(F),!.

simplify(E,E) :- atom(E), !;number(E), !.




%Basisregeln
simplify(-(-(E)), Y) :- simplify(E,Y), !.
simplify(-(E+F),Y):- simplify((-E)+(-F),Y), !.
simplify(-(E*F), Y):- simplify((-E)*F,Y), !.
simplify(0+E,Y):- simplify(E,Y), !.
simplify(E+0,Y):- simplify(E,Y), !.
simplify(0*_, 0):- !.
simplify(_*0, 0):- !.
simplify(1*E, Y):- simplify(E,Y), !.
simplify(E*1, Y):- simplify(E,Y), !.
simplify((E/1),Y):- simplify(E,Y), !.
simplify(E-0, Y):- simplify(E,Y), !.
simplify(E-E, 0):- !.



%Konstantenbehandlung

simplify(Term1 + Term2, X) :-simplify(Term1,A), simplify(Term2,B), number(A), number(B), X is A+B, !.
simplify(Term1 - Term2, X) :- simplify(Term1,A), simplify(Term2,B), number(A), number(B), X is A-B, !.
simplify(Term1 * Term2, X) :- simplify(Term1,A), simplify(Term2,B), number(A), number(B),  X is A*B, !.
simplify(Term1 / Term2, X) :- simplify(Term1,A), simplify(Term2,B), number(A), number(B), X is A/B, !.



%Variablenbehandlung

%spezielle Regeln

simplify(E*Variable + F*Variable, X*Variable) :- number(E), number(F), atom(Variable), simplify(E+F,X), !.
simplify(Variable*E + F*Variable, X*Variable) :- number(E), number(F), atom(Variable), simplify(E+F,X), !.
simplify(E*Variable + Variable*F, X*Variable) :- number(E), number(F), atom(Variable), simplify(E+F,X), !.
simplify(Variable*E + Variable*F, X*Variable) :- number(E), number(F), atom(Variable), simplify(E+F,X), !.


simplify(E*Variable-F*Variable,X*Variable) :- simplify(E-F,X), !.
simplify(E*Variable/(F*Variable), X) :- simplify(E/F,X), !.


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

simplify(Term1 + Term2, Y) :- simplify(Term1,A), simplify(Term2,B), simplify(A+B,Y), !.
simplify(Term1 - Term2, Y) :- simplify(Term1,A), simplify(Term2,B), simplify(A-B,Y), !.
simplify(Term1 * Term2, A*B) :- simplify(Term1,A), not(number(A)),  simplify(Term2,B), !. 
simplify(Term1 * Term2, A*B) :- simplify(Term1,A),  simplify(Term2,B), not(number(B)), !. 
simplify(Term1 / Term2, Y) :- simplify(Term1,A), simplify(Term2,B), simplify(A/B,Y), !.


%Aufgabe 3
aufgabe3 :- ableitung(3*x+2, x, A), simplify(A,Z1), writeln('ableitung(3*x+2, x, R)'), write('R =   '), writeln(A), write('simplify('),write(A),writeln(', Z)'), write('Z = '), writeln(Z1), writeln(''), 
ableitung(3*x*x, x, B), simplify(B,Z2), writeln('ableitung(3*x*x, x, R)'), write('R =  '),writeln(B),write('simplify('),write(B),writeln(', Z)'), write('Z = '), writeln(Z2),writeln(''), 
ableitung(y,x,C), simplify(C,Z3), writeln('ableitung(y,x,R)'), write('R =  '),writeln(C), write('simplify('),write(C),writeln(', Z)'), write('Z = '), writeln(Z3), writeln(''),
ableitung((3*x+2)*(2*x), x, D), simplify(D,Z4), writeln('ableitung((3*x+2)*(2*x), x, R)'),write('R =  '),writeln(D), write('simplify('),write(D),writeln(', Z)'), write('Z = '), writeln(Z4), writeln(''),
ableitung((x*x+2*x+3)/(3*x), x, E), simplify(E,Z5), writeln('ableitung((x*x+2*x+3)/(3*x), x, R)'),write('R =  '),writeln(E),write('simplify('),write(E),writeln(', Z)'), write('Z = '), writeln(Z5), writeln('').








%4

%Aufgabe A
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


%Aufgabe B

counties(CS) :- findall(X,(border(X,_);border(_,X)) ,LIST), sort(LIST,CS).

neighbours(C,N) :- atom(C), findall(X,(border(C,X);border(X,C)) ,N).
neighbours(VAR,N) :- var(VAR), counties(CS), bagof(VAR, (member(VAR, CS), neighbours(VAR,N)),[VAR|_]).


%Aufgabe C
colours([red,yellow,blue,green]).

%i
genColouring(Counties,Colouring) :- is_list(Counties), colours(Colours),length(Counties,Length),findnsols(Length, X=Y, (member(Y,Colours), member(X, Counties)), Colouring). 
genColouring(Counties, Colouring) :- is_list(Counties), colours(Colours), perm(Counties, PermCount), colourIt(PermCount,L1,Colours), sort(L1, Colouring). 
genColouring(Counties, Colouring) :- var(Counties), counties(Counties), genColouring(Counties, Colouring).

colourIt([],[],_) :- !.
colourIt([X|L1], [X=Z|L2],[Z|C]) :- colourIt(L1,L2,C).
colourIt(L1,L2,[]) :- colours(Colours), colourIt(L1,L2,Colours).

perm(List,PermList):-length(List,Length),length(PermList,Length), foreach(member(X,List),member(X,PermList)).


%ii
validColouring(Colouring) :- findall((X=A,Y=A),(member(X=A, Colouring), (member(Y=A, Colouring),(border(X,Y);border(Y,X)))),Z), Z = [].


%iii
colouring(Counties, Colouring) :- genColouring(Counties, Colouring), validColouring(Colouring).






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

