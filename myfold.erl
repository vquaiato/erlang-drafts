-module(myfold).
-export([myfold/3, freverse/1, fmap/2, ffilter/2]).

myfold(_, Start, []) -> Start;
myfold(Func, Start, [H|T]) -> myfold(Func, Func(H, Start), T).

freverse(L) -> myfold(fun(X, Acc) -> [X|Acc] end, [], L).

fmap(Func, L) -> myfold(fun(X, Acc) -> [Func(X)|Acc] end, [], L).

ffilter(Pred, L) -> 
    Func = fun(X, Acc) -> 
        case Pred(X) of
            true -> [X|Acc];
            false -> Acc
        end
    end,
    freverse(myfold(Func, [], L)).
