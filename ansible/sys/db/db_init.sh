#!/bin/sh

set -e

export POSTGRES_DB=$GRAFANA_DB
export POSTGRES_USER=$GRAFANA_DB_USER
export POSTGRES_PASSWORD=$GRAFANA_DB_PASSWORD

exec "/docker-entrypoint.sh" "postgres"