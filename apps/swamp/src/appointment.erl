-module(appointment).
-export([init/2]).


init(Req0, State) ->
  Method = cowboy_req:method(Req0),
  Req = process_request(Method, Req0, State),
  {ok, Req, State}.


process_request(<<"POST">>, Req0, _State) ->
  {ok, Data, Req} = cowboy_req:read_body(Req0),
  Payload = json:decode(Data),
  appointment(Payload, Req);

process_request(_, Req0, _State) ->
  cowboy_req:reply(405, #{
      <<"allow">> => <<"POST">>
  }, Req0).

appointment(#{<<"openSlotRequest">> := Slot}, Req0) ->
  appointment(open, Slot, Req0);
appointment(#{<<"appointmentRequest">> := Booking}, Req0) ->
  appointment(request, Booking, Req0).

appointment(open, #{~"doctor" := ~"mjones"}, Req0) ->

 Body = #{~"openSlotList" => [
    #{~"slot" => #{
      ~"start" => ~"1400", ~"end" => ~"1450",
      ~"doctor" => #{ ~"id" => ~"mjones"}}},
    #{~"slot" => #{
      ~"start" => ~"1600", ~"end" => ~"1650",
      ~"doctor" => #{ ~"id" => ~"mjones"}}}
  ]},

  cowboy_req:reply(200, #{
    ~"content-type" => ~"application/json"
  }, json:encode(Body), Req0);

appointment(request, #{~"slot" := Slot, ~"patient" := Patient}, Req0)
  when Patient =:= #{~"id" => ~"jsmith"} ->

  Body = #{~"appointment" =>
    #{~"slot" => Slot, ~"patient" => Patient}},

  cowboy_req:reply(200, #{
    ~"content-type" => ~"application/json"
  }, json:encode(Body), Req0).
