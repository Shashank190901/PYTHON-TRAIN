% Define predicates for the monkey actions
monkey_go_box(X, Y) :-
    format('monkey slave ~w Go to ~w~n', [X, Y]).

monkey_move_box(X, Y) :-
    format('monkey take the box from ~w deliver to ~w~n', [X, Y]).

monkey_on_box :-
    write('Monkey climbs up the box'), nl.

monkey_get_banana :-
    write('Monkey picked a banana'), nl.

% Read input parameters for monkey, banana, and box
read_input :-
    read(Monkey),
    atom_number(MonkeyAtom, Monkey),
    read(Banana),
    atom_number(BananaAtom, Banana),
    read(Box),
    atom_number(BoxAtom, Box),
    monkey_go_box(MonkeyAtom, BoxAtom),
    monkey_move_box(BoxAtom, BananaAtom),
    monkey_on_box,
    monkey_get_banana.

% Define the entry point
:- initialization(read_input).
