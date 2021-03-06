gen0083/android-sdk
=======

## Dockerfileからイメージ復元

1. カレントディレクトリにDockerfileがある状態で`docker build -t gen0083/android-sdk .`

SDKのアップデートを行うためにキャッシュを使いたくない場合は`--no-cache`オプションをつける。

## イメージの動作確認

`docker run -it gen0083/android-sdk`

## DockerHubへpush

`docker login`でDocker Hubにログイン

`docker push gen0083/android-sdk`でイメージをdocker hubに登録

## コンテナの削除

1. `docker ps`で稼働中のコンテナを確認
1. `docker ps -a`で停止中のコンテナを含めて確認
1. `docker rm コンテナID`でコンテナを削除

`docker rm $(docker ps -aq)`とすると手っ取り早くコンテナ全削除ができる

## イメージの削除

1. `docker images`でイメージIDを確認
1. `docker rmi イメージID`で削除

## docker for Mac

コンテナやイメージを削除してもディスクスペースが開放されないバグがある。

https://github.com/docker/for-mac/issues/371

~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2を手動で削除する
