gen0083/android-sdk
=======

## Dockerfileからイメージ復元

1. カレントディレクトリにDockerfileがある状態で`docker build -t リポジトリ名 .`

SDKのアップデートを行うためにキャッシュを使いたくない場合は`--no-cache`オプションをつける。

## イメージの動作確認

`docker run -it コンテナ`

## DockerHubへpush

`docker push リポジトリ`

## コンテナの削除

1. `docker ps`で稼働中のコンテナを確認
1. `docker ps -a`で停止中のコンテナを含めて確認
1. `docker rm コンテナID`でコンテナを削除

`docker rm $(docker ps -aq)`とすると手っ取り早くコンテナ全削除ができる

## イメージの削除

1. `docker images`でイメージIDを確認
1. `docker rmi イメージID`で削除
