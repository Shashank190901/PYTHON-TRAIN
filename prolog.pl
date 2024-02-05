% Define the distances between cities
distance(a, b, 10).
distance(a, c, 15).
distance(a, d, 20).
distance(b, c, 35).
distance(b, d, 25).
distance(c, d, 30).

% Define predicate to find the path
tsp(Path, Cost) :-
    % Define the cities
    Cities = [a, b, c, d],
    % Start with a random permutation of cities
    permutation(Cities, Path),
    % Calculate the cost of the path
    calculate_cost(Path, Cost).

% Base case: Calculate the cost of the path
calculate_cost([_], 0).
calculate_cost([City1, City2 | Rest], TotalCost) :-
    distance(City1, City2, Cost),
    calculate_cost([City2 | Rest], RestCost),
    TotalCost is Cost + RestCost.

% Find the optimal path
find_optimal(Path, Cost) :-
    findall([P, C], tsp(P, C), Paths),
    min_member([Path, Cost], Paths).
