# level 0: Swamp of POX

You can use Erlang + cowboy to simulate a swamp of pox style HTTP API.

```erlang
appointment(#{<<"openSlotRequest">> := Slot}, Req0) ->
  appointment(open, Slot, Req0);
appointment(#{<<"appointmentRequest">> := Booking}, Req0) ->
  appointment(request, Booking, Req0).
```

See: [Richardson Maturity Model][1].

## Build

```bash
rebar3 compile
rebar3 release
```

## Run

```bash
docker compose up -d
```

## Examples

```bash
# Open slots on a given date. 
curl 'http://127.0.0.1:8080/appointmentService/' --json '
{
  "openSlotRequest": {
    "date": "2010-01-04",
    "doctor": "mjones"
  }
}'

# Book an appointment.
curl 'http://127.0.0.1:8080/appointmentService/' --json '{
  "appointmentRequest": {
    "slot": {
      "doctor": "mjones",
      "start": "1400",
      "end": "1450"
    },
    "patient": {
      "id": "jsmith"
    }
  }
}'
```

## See also

- [Richardson Maturity Model][2] - wikipedia\.org
- [REST APIs must be hypertext-driven][3] (2008) - roy\.gbvi\.com
- [Should we rebrand REST?][4] (2021) - kieranpotts\.com

[1]: https://martinfowler.com/articles/richardsonMaturityModel.html
[2]: https://en.wikipedia.org/wiki/Richardson_Maturity_Model 
[3]: https://roy.gbiv.com/untangled/2008/rest-apis-must-be-hypertext-driven
[4]: https://kieranpotts.com/rebranding-rest
