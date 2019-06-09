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
