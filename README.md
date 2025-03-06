# swamp

An OTP application

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
