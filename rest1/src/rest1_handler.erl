-module(rest1_handler).
-behaviour(cowboy_http_handler).

-export([init/3]).
-export([terminate/3]).
-export([handle/2]).
-export([allowed_methods/2]).
-export([content_types_provided/2]).
-export([content_types_accepted/2]).

-export([handle_get/2]).
-export([handle_post/2]).

%% this starts up every time someone nvokes the endpoints....
init(_, _, _) ->
    io:format("init:got here!~p~n", ["d"]),
    {upgrade, protocol, cowboy_rest}.

%% intercept the call in the pipeline.....
handle(Req, State) ->
    {ok, Req, State}.

%%function that get called if behaviour was terminated
terminate(_Reason, _Req, _State) ->
    ok.

%% functions are allowed for the end point
allowed_methods(Req, State) ->
    io:format("allowed_methods: got here! ~p~n", ["d"]),
    {[<<"GET">>, <<"POST">>], Req, State}.

%% this function called on GET
content_types_provided(Req, State) ->
    io:format("content_types_provided: got here! ~p~n", ["d"]),
    {[
	{{<<"application">>, <<"json">>, []}, handle_get}
	], Req, State}.

%% this function called on post
content_types_accepted(Req, State) ->
    io:format("content_types_accepted: got here!~p~n", ["d"]),
    {[
	{{<<"application">>, <<"json">>, []}, handle_post}
	], Req, State}.

%% the get call did
handle_get(Req, State) ->
    io:format("handle_get: got here!~p~n", ["d"]),
    Body = jsx:encode([{<<"library">>,<<"jsx">>}, {<<"awesome">>, true},{<<"IsAwesome">>,<<"ME">>}]),
    {Body, Req, State}.

%% this is what post call does
handle_post(Req, State) ->
    io:format("handle_post:got here! ~p~n", ["d"]),
    {ok, _, Req2} = cowboy_req:body(Req),
    Body = jsx:encode([{<<"library">>, <<"derp">>},{<<"awesome">>,<<"nerp">>},{<<"IsAwesome">>,<<"ME">>}]),
    Req3 = cowboy_req:set_resp_body(Body, Req2),
    {true, Req3, State}.
