-module(rooms_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

init(_Transport, Req, []) ->
    {ok, Req, undefined}.

handle(Req, State) ->
	{Room, Req} = cowboy_req:path_info(Req),
	{Host, Req} = cowboy_req:host_info(Req),
	{ok, Body} = rooms_dtl:render([{room, Room}, {host, Host}]),
    Headers = [{<<"Content-Type">>, <<"text/html">>}],
    {ok, Req2} = cowboy_req:reply(200, Headers, Body, Req),
    {ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
    ok.
