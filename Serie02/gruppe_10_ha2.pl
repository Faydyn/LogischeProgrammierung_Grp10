/*
Adnan Alyousfi, 218205332, Informatik
Dirk Peglow, Informatik
Nils Seitz, 218205308, Informatik
Lorka Trad, Informatik
Nico Trebbin, 218204402, Informatik
*/

% Aufgabe 2

% 2.A

%ableitung(Funktion,Variable,Ableitung).

% i.
ableitung(Variable,Variable,1) :- !.

% ii.
ableitung(C, Variable, 0) :-  atomic(C), Variable \== C,!.

%iii.
ableitung(Factor*Variable,Variable,Factor) :- atomic(Factor), Factor \== Variable,!.
ableitung(Factor*Variable+C,Variable,Factor) :- atomic(C), C \== Variable, atomic(Factor), Factor \== Variable,!.

%iv
ableitung(Function1+Function2,X,Derivative) :- ableitung(Function1,X,Y1), ableitung(Function2,X,Y2), Derivative = Y1+Y2,!. 

%v
ableitung(Function1*Function2,X,Derivative) :- ableitung(Function1,X,Y1), ableitung(Function2,X,Y2), Derivative = (Y1*Function2 + Function1*Y2),!.

%vi
ableitung(Function1/Function2,X,Derivative)  :- ableitung(Function1,X,Y1), ableitung(Function2,X,Y2), Derivative = ((Y1*Function2 - Function1*Y2)/(Function2*Function2)),!.


%2.B

a2b :- ableitung(3*x+2, x, A), writeln('ableitung(3*x+2, x, R)'), write('R =   '), writeln(A), writeln(''), ableitung(3*x*x, x, B), writeln('ableitung(3*x*x, x, R)'), write('R =  '),writeln(B),writeln(''), ableitung(y,x,C), writeln('ableitung(y,x,R)'), write('R =  '),writeln(C),writeln(''),
ableitung((3*x+2)*(2*x), x, D), writeln('ableitung((3*x+2)*(2*x), x, R)'),write('R =  '),writeln(D), writeln(''), ableitung((x*x+2*x+3)/(3*x), x, E), writeln('ableitung((x*x+2*x+3)/(3*x), x, R)'),write('R =  '),writeln(E),writeln('').



