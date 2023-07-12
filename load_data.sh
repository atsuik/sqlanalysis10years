#! /usr/bin/env bash

data_small_url=https://i.loveruby.net/stdsql/files/stdsql-20201213.zip
data_large_url=https://i.loveruby.net/stdsql/files/stdsql-large-20201213.zip

echo "make dir"
mkdir -p data/small

if [ ! -f data/small/data.zip ]; then
curl -fL ${data_small_url} -o data/small/data.zip
fi
unzip -o data/small/data.zip -d data/small

cd data/small
echo "Load small data"
PGPASSWORD=$POSTGRES_PASSWORD psql -h db -U $POSTGRES_USER $POSTGRES_DB -f load.sql

echo "Loading sample data complete"

