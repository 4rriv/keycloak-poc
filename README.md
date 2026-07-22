以下の環境で動作確認を行っています。

* **OS:** WSL2 (Ubuntu 24.04 LTS / noble)
* **Docker Engine:** v29.1.3
* **Docker Compose:** v2.40.3
* **Node.js:** v26.4.0 (Vue.js ビルド用)

node.js未インストールの場合、以下のコマンドでインストール可能
```
bash ./install_node.sh 
```

デプロイは以下のコマンドで実行
```
bash ./start.sh
```
1を押下して通常起動
2を押下するとログイン画面がカスタムテーマのものが起動
3を押下するとすべてのコンテナ・イメージ・ボリュームを削除

---

システム構成 (Architecture)

| サービス名 | ポート (ホスト:コンテナ) | 役割 |
| :--- | :--- | :--- |
| **OAuth2-Proxy** | `3000:4180` | エントリーポイント。未認証リクエストを Keycloak へリダイレクト |
| **Keycloak** | `8080:8080` | OIDC 認証プロバイダ (IdP) |
| **Nginx** | `80:80` (内部) | Vue.js のビルド成果物を配信する Web サーバー |
| **Postgres** | - (内部) | Keycloak のデータ保存用 DB |

---


