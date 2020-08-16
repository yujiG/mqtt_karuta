# localhost手順
1. mosquittoサーバーの準備（同じサーバーじゃないと動かないです）

修正
```
vim /usr/local/etc/mosquitto/mosquitto.conf

# my conf
listener 1883
listener 1884
rotocol websockets
```

起動

```
# 起動
mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf
```

2. rails の初期準備
```
bundle install --path vendor/bundle
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

3. 起動

```
bundle exec rails s -p 3001
```
