# level 0: Swamp of POX

You can use Erlang + cowboy to simulate a swamp of pox style HTTP API.

```erlang
appointment(#{<<"openSlotRequest">> := Slot}, Req0) ->
  appointment(open, Slot, Req0);
appointment(#{<<"appointmentRequest">> := Booking}, Req0) ->
  appointment(request, Booking, Req0).
```

## Build

```bash
rebar3 compile
```

## Run

```bash
docker compose up -d
```

## Examples

```bash
curl http://127.0.0.1:8080/appointmentService/ --json '
{
  "openSlotRequest": {
    "date": "2010-01-04",
    "doctor": "mjones"
  }
}'
```


