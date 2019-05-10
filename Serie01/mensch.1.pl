parent(marie, gustaf).
parent(konrad, gustaf).
parent(taylor, mozart).
parent(konrad, mozart).%Gen 2
parent(gustaf, sandra).
parent(eva, sandra).
parent(mozart, ingrid).
parent(marie, ingrid).
parent(mozart, alberta).%Gen 3
parent(sandra, theodor).
parent(ute, theodor).
parent(alberta, friedrich).
parent(fridolin, friedrich).
male(gustaf).
male(konrad).
male(fridolin).
male(friedrich).
male(theodor).
male(mozart).
female(marie).
female(taylor).
female(sandra).
female(ingrid).
female(eva).
female(alberta).
female(ute).%Gen 1
family(X,Y,Z) :- parent((male(X)),Z), parent(female(Y),Z).