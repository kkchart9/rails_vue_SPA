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

## APIコントローラー作成

```
docker-compose run --rm app ./bin/rails g controller api::books { 複数形 }
```

## Model Migrationファイル作成

```
docker-compose run --rm app ./bin/rails g Books { 複数形 }
```

## routes.rb編集

```
resources :books, only: [:index] { 追加したメソッド }
```

## Vueファイル作成

- app/javascript/*　を変更

## route.js編集
