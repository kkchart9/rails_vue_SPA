# 環境構築手順

## Docker

```
docker-compose build
docker-compose up
```

## データベース

```
docker-compose run --rm app ./bin/rails db:create
docker-compose run --rm app ./bin/rails db:migrate
docker-compose run --rm app ./bin/rails db:seed
```
