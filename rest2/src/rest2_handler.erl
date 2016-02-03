-module(rest2_handler).

-behaviour(cowboy_http_handler).

-export([init/3]).
-export([terminate/3]).
-export([handler/2]).
-export([content_types_provided/2]).
-export([hello_to_json/2]).
-export([hello_to_text/2]).

init(_, _, _) ->
    io:format("init got here! ~p~n", ["d"]),
    {upgrade, protocol, cowboy_rest}.

handle(Req,  State) ->
    {ok, Req, State}.

terminate(_Reason, _Req, _State) ->
    ok.

content_types_provided(Req, State) ->
    io:format("content_types_provided got here! ~p~n", ["d"]),
    {[
	{<<"application/json">>, hello_to_json},
        {<<"text/plain">>, hello_to_text}
    ], Req, State}.

hello_to_json(Req, State) ->
    Body = <<"{\"rest\": \"Hello World!\"}">>,
    {Body, Req, State}.

hello_to_text(Req, State) ->
    {<<"REST Hello World as text">>, Req, State}.
