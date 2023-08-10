#!/bin/bash

node_env=$1
port=$2
db_user=$3
db_password=$4
db_host=$5
db_name=$6
db_port=$7
pathMainDir="/var/www/test/deploy-test"
migrations=$(find /var/www/test/deploy-test/src/db/migrations | wc -l)

cd /var/www || exit
pm2 stop deploy-test
pm2 delete deploy-test
if [[ -d pathMainDir ]]; then
  echo "Directory $pathMainDir exists"
  cd test/deploy-test/ || exit
  git pull origin main
  echo "Deployment succesful"
  npm install
  echo -e "NODE_ENV=$node_env\nPORT=$port\nDB_USER=$db_user\nDB_PASSWORD=$db_password\nDB_HOST=$db_host\nDB_NAME=$db_name\nDB_PORT=$db_port" > .env
  pm2 start index.js --name deploy-test
  if [[ migrations -gt $(find /var/www/test/deploy-test/src/db/migrations | wc -l) ]]; then
    npm run migrations:run
  fi
  else
  echo "Directory not found"
  mkdir test
  cd test || exit
  git clone git@github.com:Sharmaz/deploy-test.git
  echo "Deployment succesful"
  cd deploy-test || exit
  npm install
  echo -e "NODE_ENV=$node_env\nPORT=$port\nDB_USER=$db_user\nDB_PASSWORD=$db_password\nDB_HOST=$db_host\nDB_NAME=$db_name\nDB_PORT=$db_port" > .env
  pm2 start index.js --name deploy-test
  npm run migrations:run
  npm run migrations:run:seed
fi

