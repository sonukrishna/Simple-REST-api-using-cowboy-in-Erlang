%%%-------------------------------------------------------------------
%% @doc rest2rel public API
%% @end
%%%-------------------------------------------------------------------

-module(rest2rel_app).

-behaviour(application).

%% Application callbacks
-export([start/2
        ,stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    rest2rel_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
