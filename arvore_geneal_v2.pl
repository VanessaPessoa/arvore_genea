%fatos
homem(joao).
homem(paulo).
homem(fabio).
homem(carlos).
homem(teodoro).
homem(jose).
homem(tomaz).
homem(felipe).
homem(ricardo).

mulher(maria).
mulher(clara).
mulher(joana).
mulher(talita).
mulher(ana).
mulher(carla).
mulher(isabel).
mulher(julia).
mulher(marta).
mulher(raquel).
mulher(juliana).

progenitor(joao, clara).
progenitor(joao, joana).
progenitor(paulo, talita).
progenitor(carlos, andre).
progenitor(carlos, carla).
progenitor(andre, fabio).
progenitor(fabio, teodoro).
progenitor(ricardo, felipe).
progenitor(ricardo, raquel).
progenitor(jose, tomaz).
progenitor(tomaz, juliana).
progenitor(maria, clara).
progenitor(maria, joana).
progenitor(clara, talita).
progenitor(ana, andre).
progenitor(ana, carla).
progenitor(julia, felipe).
progenitor(julia, raquel).
progenitor(marta, tomaz).
progenitor(raquel, juliana).
progenitor(juliana, isadora).
progenitor(juliana, teodoro).
progenitor(joana, fabio).
progenitor(fabio, isabel).
progenitor(juliana, isabel).


%definir regras

filho(X,Y) :-
    progenitor(Y,X),
    homem(X).

filha(X,Y) :-
    progenitor(Y,X),
    mulher(X).

avo_h(X, Z) :-
    progenitor(X, Y),
    progenitor(Y, Z),
    homem(X).

avo_m(X, Z) :-
    progenitor(X, Y),
    progenitor(Y, Z),
    mulher(X).

avo(X,Z) :-
    progenitor(X, Y),
    progenitor(Y, Z).

neto(X,Y) :-
    avo(Y,X),
    homem(X).

neta(X,Y) :-
    avo(Y,X),
    mulher(X).

irmao_irma(X, Y) :-
    progenitor(Z, X) ,
    progenitor(Z, Y),
     X\=Y.

irma(X,Y) :-
    progenitor(Z, X) ,
    progenitor(Z, Y),
    mulher(X),
     X\=Y.

irmao(X,Y) :-
    progenitor(Z, X) ,
    progenitor(Z, Y),
    homem(X),
     X\=Y.

tio_tia(X,Y) :-
   progenitor(Z,Y),
   irmao_irma(Z,X),
   X\=Y.

tia(X,Y) :-
   progenitor(Z,Y),
   irmao_irma(Z,X),
   mulher(X),
       X\=Y.
tio(X,Y) :-
   progenitor(Z,Y),
   irmao_irma(Z,X),
   homem(X),
  X\=Y.


primo(X, Y) :-
    tio_tia(Z,Y),
    progenitor(Z,X),
    homem(X),
    X\=Y.

prima(X, Y) :-
    tio_tia(Z,Y),
    progenitor(Z,X),
    mulher(X),
    X\=Y.

primo_prima(X, Y) :-
    tio_tia(Z,Y),
    progenitor(Z,X),
    X\=Y.

primo_segundo(X,Y) :-
    primo_prima(Z,Y),
    progenitor(Z,X).
