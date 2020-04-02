+%s(num of people on the right,num of Monsters on the right, 0 boat is on the left -- 1 boat is on the right, num of people on the left,num of Monsters on the left).
%1-move 1 person from right to left
move(state(PR,MR,1,PL,ML),state(NPR,MR,0,NPL,ML)):-
PR > 0,
NPL is PL + 1,
NPR is PR - 1.


%2-move 2 person from right to left
move(state(PR,MR,1,PL,ML),state(NPR,MR,0,NPL,ML)):-
PR > 1,
NPL is PL + 2,
NPR is PR - 2.

%3-move 1 monster from right to left
move(state(PR,MR,1,PL,ML),state(PR,NMR,0,PL,NML)):-
MR > 0,
NML is ML + 1,
NMR is MR - 1.

%4-move 2 monster from right to left
move(state(PR,MR,1,PL,ML),state(PR,NMR,0,PL,NML)):-
MR > 1,
NML is ML + 2,
NMR is MR - 2.


%5-move 1 human & 1 monster from left to right
move(state(PR,MR,1,PL,ML),state(NPR,NMR,0,NPL,NML)):-
PR > 0,
MR > 0,
NPL is PL + 1,
NPR is PR - 1,
NML is ML + 1,
NMR is PR - 1.

%6-move 1 person from left to right
move(state(PR,MR,0,PL,ML),state(NPR,MR,1,NPL,ML)):-
PL > 0,
NPL is PL - 1,
NPR is PR + 1.

%7-move 2 person from left to right
move(state(PR,MR,0,PL,ML),state(NPR,MR,1,NPL,ML)):-
PL > 1,
PL > 0,
NPL is PL - 2,
NPR is PR + 2.

%8-move 1 monster from left to right
move(state(PR,MR,0,PL,ML),state(PR,NMR,1,PL,NML)):-
ML > 0,
NML is ML - 1,
NMR is MR + 1.

%9-move 2 monster from left to right
move(state(PR,MR,0,PL,ML),state(PR,NMR,1,PL,NML)):-
ML > 1,
NML is ML - 2,
NMR is MR + 2.

%10-move 1 human & 1 monster from left to right
move(state(PR,MR,0,PL,ML),state(NPR,NMR,1,NPL,NML)):-
PL > 0,
ML > 0,
NPL is PL - 1,
NPR is PR + 1,
NML is ML - 1,
NMR is MR + 1.



unsafestate(state(_,_,_,PR,MR)):-
MR > PR,PR=\=0.


unsafestate(state(PL,ML,_,_,_)):-
ML > PL,PL=\=0.

mygame(S,G):-
	path(S,[S],G),
	write(G),nl,nl.


path(state(0,0,0,3,3),L,L).


	
path(State,Visited,L):-
move(State,NextState),
\+ unsafestate(NextState),
\+ member(NextState,Visited),
path(NextState,[NextState|Visited],L).



