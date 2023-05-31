# Clickhouse Cluster

Clickhouse cluster with 1 shard and 2 replicas built with docker-compose.

Not for production use.

## Run

Run single command, and it will copy configs for each node and
run clickhouse cluster `company_cluster` with docker-compose
```sh
make config up
```

Containers will be available in docker network `172.23.0.0/24`

| Container    | Address
| ------------ | -------
| zookeeper    | 172.23.0.10
| clickhouse01 | 172.23.0.11
| clickhouse02 | 172.23.0.12

## Test it

Login to clickhouse01 console (first node's ports are mapped to localhost)
```sh
clickhouse-client -h localhost
```

Or open `clickhouse-client` inside any container
```sh
docker exec -it clickhouse01 clickhouse-client -h localhost
```

## Start, stop

Start/stop the cluster without removing containers
```sh
make start
make stop
```

## Teardown

Stop and remove containers
```sh
make down
```
