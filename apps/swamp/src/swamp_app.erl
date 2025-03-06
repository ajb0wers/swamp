%%%-------------------------------------------------------------------
%% @doc swamp public API
%% @end
%%%-------------------------------------------------------------------

-module(swamp_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/appointmentService", appointment, []}]}
    ]),
    {ok, _} = cowboy:start_clear(swamp_http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}),

    swamp_sup:start_link().

stop(_State) ->
    ok.
