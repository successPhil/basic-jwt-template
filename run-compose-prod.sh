#!/bin/sh

# The Dockerhub account where the images are stored
export DOCKERHUB_UNAME=successphil
export SECRET_KEY=abc123
export DEBUG=True
export POSTGRES_DB=jwt_auth_db
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export DOMAIN='3.87.29.255'
export AWS_SES_REGION_NAME=$1
export AWS_ACCESS_KEY_ID=$2
export AWS_SECRET_ACCESS_KEY=$3
export NEW_VERSION=$4


docker-compose -f docker-compose.prod.yml build --no-cache
docker-compose -f docker-compose.prod.yml up -d

# make sure the postgres container is ready, then run migrations
sleep 10 
docker exec basic-jwt-template-api-1 python /src/manage.py makemigrations 
docker exec basic-jwt-template-api-1 python /src/manage.py migrate