/*
Adnan Alyousfi, 218205332, Informatik
Dirk Peglow, Informatik
Nils Seitz, 218205308, Informatik
Lorka Trad, Informatik
Nico Trebbin, 218204402, Informatik
*/

blup(L, E, R) :-
  append(L1, [E|L2], L), append(L1, L2, R).

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