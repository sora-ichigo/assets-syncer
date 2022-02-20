# :dango: igsr5-assets
igsr5's assets sync between local and s3.



## Design

`aws s3 sync` を実行するスクリプトを docker コンテナ内で定期実行している。

- [sync_images.sh](https://github.com/igsr5/igsr5-assets/blob/master/sync_images.sh) `aws s3 sync` を実行
- [job/sync_s3.rb](https://github.com/igsr5/igsr5-assets/blob/master/job/sync_s3.rb) 上記のスクリプトを定期実行

## Development
:one: `.env.sample` をコピーして `.env` を作成し、環境変数を記述する.

:two: docker コンテナを立ち上げる。

```sh
$ docker compose up -d
```

:three: `./images` に適当な画像を置いて `https://images.igsr5.com/OOO` (OOO はファイル名) でアクセスできれば OK :tada:
  - もし画像が表示されなければ、`/logs/stdout.log` を確認する。


## :bulb: Background
いつもサービス作る時に画像どこから配信しようって考えるからそれ考えなくていいような仕組み作りたかった。  

e.g.  ポートフォリオサイトを作るとき、プロフィール画像や成果物の写真をどこにアップロードしようか迷った。
