-module(yoz_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

init(_Transport, Req, []) ->
    {ok, Req, undefined}.

handle(Req, State) ->
    {ok, Req2} = cowboy_req:reply(200, headers(), generate_body(Req), Req),
    {ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
    ok.

%%
%% Private functions
%%
headers() ->
	[{<<"Content-Type">>, <<"text/html">>}].

generate_body(Req) ->
	{ok, Body} = yoz_dtl:render(extract_variables(Req)),
	Body.

extract_variables(Req) ->
	{Room, _Req} = cowboy_req:path_info(Req),
	{Host, _Req} = cowboy_req:host_info(Req),
	[{room, Room}, {host, Host}].
