-module(mytree).
-export([empty/0, insert/3, lookup/2]).

%% just creates an empty tree, a node pointing to nothing
empty() -> {node, nil}.

insert(Key, Value, {node, nil}) -> {node, {Key, Value, {node, nil}, {node, nil}}};

insert(NewKey, NewValue, {node, {Key, Value, Smaller, Larger}}) when NewKey < Key ->
    {node, {Key, Value, insert(NewKey, NewValue, Smaller), Larger}};

insert(NewKey, NewValue, {node, {Key, Value, Smaller, Larger}}) when NewKey > Key ->
    {node, {Key, Value, Smaller, insert(NewKey, NewValue, Larger)}};

insert(Key, Value, {node, {Key, _, Smaller, Larger}}) ->
    {node, {Key, Value, Smaller, Larger}}.

lookup(_, {node, nil}) -> undefined;
lookup(Key, {node, {Key, Val, _, _}}) -> {ok, Val};
lookup(Key, {node, {NodeKey, _, Smaller, _}}) when Key < NodeKey -> lookup(Key, Smaller);
lookup(Key, {node, {_, _, _, Larger}}) -> lookup(Key, Larger).
