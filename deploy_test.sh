#!/bin/bash

node_env=$1
port=$2
db_user=$3
db_password=$4
db_host=$5
db_name=$6
db_port=$7

echo -e "NODE_ENV=$node_env\nPORT=$port\nDB_USER=$db_user\nDB_PASSWORD=$db_password\nDB_HOST=$db_host\nDB_NAME=$db_name\nDB_PORT=$db_port" > .env
