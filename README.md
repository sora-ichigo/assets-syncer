# :dango: Assets syncer.
![](https://img.shields.io/badge/license-MIT-green)


igsr5's assets sync between local and s3.  
指定のローカルディレクトリに画像を置くだけで https://images.igsr5.com から配信できる。


![trim D9D9155D-3004-4BF2-9E2D-1481599842FE 2](https://user-images.githubusercontent.com/66525257/154830179-acccf9bf-9d2e-4fd5-847c-ff5b104279e4.gif)

→ https://images.igsr5.com/profile.png で公開



## 🏝️ Design

`aws s3 sync` を実行するスクリプトを docker コンテナ内で定期実行している。

- [sync_images.sh](https://github.com/igsr5/igsr5-assets/blob/master/sync_images.sh) `aws s3 sync` を実行
- [job/sync_s3.rb](https://github.com/igsr5/igsr5-assets/blob/master/job/sync_s3.rb) 上記のスクリプトを定期実行

同期した s3 バケットは CloudFront 経由で配信している。
サンプル画像 https://images.igsr5.com/sample.png

詳しいインフラ構成は OO に書いてある。

## 📝 Development
:one: `.env.sample` をコピーして `.env` を作成し、環境変数を記述する.

:two: docker コンテナを立ち上げる。

```sh
$ docker compose up -d
```

:three: `./images` に適当な画像を置いて `https://images.igsr5.com/OOO` (OOO はファイル名) でアクセスできれば OK :tada:
  - もし画像が表示されなければ、`/logs/stdout.log` を確認する。


## :bulb: Background
いつもサービス作る時に画像どこから配信しようって考えるからそれ考えなくていいような仕組みが作りたかった。  

e.g.  ポートフォリオサイトを作るとき、プロフィール画像や成果物の写真をどこにアップロードしようか迷った。
