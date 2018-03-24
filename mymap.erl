-module(mymap).
-export([my_map/2]).

my_map(_, []) -> [];
my_map(Func, X) when not is_list(X) -> my_map(Func, [X]);
my_map(Func, [H|T]) -> [Func(H)|my_map(Func, T)].