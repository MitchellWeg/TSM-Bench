#!/bin/sh

MASTER_DB_EXISTS=false

if [ -d "$(pwd)/master_db" ]; then
  MASTER_DB_EXISTS=true
fi

if ! $MASTER_DB_EXISTS; then
  echo "creating master_db\n"
  monetdbd create master_db
  monetdbd set port=54320 master_db
fi

monetdbd start master_db

if ! $MASTER_DB_EXISTS; then
  echo "creating mydb\n"
  monetdb create mydb
  monetdb release mydb
  ./load.sh
fi
