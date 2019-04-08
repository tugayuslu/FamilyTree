parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(liz,ali).
parent(ali,zali).


hasTwoChildren(X):-
    parent(X,Y),!,parent(X,Z),Y\=Z,!,not(hasTwoPlusChildren(X)).
hasTwoPlusChildren(X):-
    parent(X,K),!,parent(X,L),parent(X,M),K\=L,K\=M,L\=M,!.


grandChildren(X,Y):-
          parent(X,Z),parent(Z,Y),!.
grandChildren(X,Y):-
          parent(Y,Z),parent(Z,X),!.


sibling(X,Y):-
    parent(Z,X),parent(Z,Y),X\=Y.


firstCousin(X,Y):-
    parent(K,X),parent(L,Y),sibling(K,L).


distantCousin(X,Y):-
    not(firstCousin(X,Y)),parent(K,X),parent(L,Y),firstCousin(K,L),!.
distantCousin(X,Y):-
    parent(K,X),parent(L,Y),distantCousin(K,L),!.
    

start:-
    writeln("For hasTwoChildren press a"),
    writeln("For grandChildren press b"),
    writeln("For sibling press c"),
    writeln("For firstCousin press d"),
    writeln("For distantCousin press e"),
    read(R),continue(R).
   
   
continue(X):-
    X==a,writeln("Name ?"),read(R),hasTwoChildren(R),!.
continue(X):-
    X==b,writeln("First Name ?"),read(F),writeln("Second Name ?"),read(S),grandChildren(F,S),!.
continue(X):-
    X==c,writeln("First Name ?"),read(F),writeln("Second Name ?"),read(S),sibling(F,S),!.
continue(X):-
    X==d,writeln("First Name ?"),read(F),writeln("Second Name ?"),read(S),firstCousin(F,S),!.
continue(X):-
    X==e,writeln("First Name ?"),read(F),writeln("Second Name ?"),read(S),distantCousin(F,S),!.