# Running labs with Docker

## Goal

Use a single, standardized MongoDB container for all labs.

## Start Mongo

From the repo root:

```shell
docker compose up -d
```

## Wait for Mongo to be ready

Run the wait script before starting a lab:

```shell
py scripts\wait_for_mongo.py --host 127.0.0.1 --port 27017 --timeout 60
```

## Lab runner expectations

- Use the root `docker-compose.yml` as the single Mongo source.
- If a lab needs its own compose file, keep the service name `mongo` and port `27017`.

## Troubleshooting

- Service not running:
  - `docker compose ps` and `docker compose logs mongo`
- Port conflicts:
  - Stop the conflicting service or change the port mapping in `docker-compose.yml`.
- Connection errors:
  - Verify Mongo is healthy before running the lab.
