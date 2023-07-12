#! /usr/bin/env bash

data_small_url=https://i.loveruby.net/stdsql/files/stdsql-20201213.zip
data_large_url=https://i.loveruby.net/stdsql/files/stdsql-large-20201213.zip

echo "make dir"
mkdir -p data/large


if [ ! -f data/large/data.zip ]; then
curl -fL ${data_large_url} -o data/large/data.zip
fi
unzip -o data/large/data.zip -d data/large

cd data/large
echo "Load large data"
PGPASSWORD=$POSTGRES_PASSWORD psql -h db -U $POSTGRES_USER $POSTGRES_DB -f load.sql

echo "Loading large sample data complete"

