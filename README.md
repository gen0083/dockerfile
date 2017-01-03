gen0083/android-sdk
=======

## Dockerfileからイメージ復元

1. カレントディレクトリにDockerfileがある状態で`docker build -t リポジトリ名 .`



## コンテナの削除

1. `docker ps`で稼働中のコンテナを確認
1. `docker ps -a`で停止中のコンテナを含めて確認
1. `docker rm コンテナID`でコンテナを削除

## イメージの削除

1. `docker images`でイメージIDを確認
1. `docker rmi イメージID`で削除

RUN echo -e "e6b7c2ab7fa2298c15165e9583d0acf0b04a2232\n8933bad161af4178b1185d1a37fbf41ea5269c55" > $ANDROID_HOME/licenses/android-sdk-license
