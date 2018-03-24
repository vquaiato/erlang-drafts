-module(myfilter).
-export([myfilter/2]).

myfilter(Pred, List) -> lists:reverse(myfilter(Pred, List, [])).

%% we don't care about the Predicate
%% if the list is empty, just return the accumulator.
myfilter(_, [], Acc) -> Acc;
%% we have an actual list
myfilter(Pred, [H|T], Acc) ->
    case Pred(H) of % we check the predicat against the first element (Head)
        true -> myfilter(Pred, T, [H|Acc]); % if it is a match, we prepend the head to the accumulator
        false -> myfilter(Pred, T, Acc) % otherwise move on until it reaches the base case 
    end.