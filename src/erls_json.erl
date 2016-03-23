-module(erls_json).

-export([encode/1
	,encode/2
        ,decode/1
	,decode/2]).

-include("erlastic_search.hrl").

%%--------------------------------------------------------------------
%% @doc
%% Encodes the user-supplied `Json' with the user's defined JSON
%% module (defaults to `jsx`)
%% In particular, this function cannot be used to encode any JSON
%% built internally to `erlastic_search` as we do not know how
%% the user's JSON module encodes JSONs in Erlang
%% @end
%%--------------------------------------------------------------------
-spec encode(erlastic_json()) -> binary().
encode(Json) ->
    encode(Json, []).

encode(Json, Options) ->
    ?ERLASTIC_SEARCH_JSON_MODULE:encode(Json, Options).

%%--------------------------------------------------------------------
%% @doc
%% Decodes the given `BinaryJson' with the user's defined JSON
%% module (defaults to `jsx`)
%% The same caveat as for `encode/1' above applies
%% @end
%%--------------------------------------------------------------------
-spec decode(binary()) -> erlastic_json().
decode(BinaryJson) ->
    decode(BinaryJson, [return_maps]).

decode(BinaryJson, Options) ->
    ?ERLASTIC_SEARCH_JSON_MODULE:decode(BinaryJson, Options).
