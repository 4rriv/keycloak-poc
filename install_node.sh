#!/bin/bash

# エラーが発生したらその時点でスクリプトを終了する設定
set -e

echo "=== Node.js (v24) & nvm セットアップスクリプト ==="

# 1. nvm が未インストールの場合のみダウンロードしてインストール
if [ ! -d "$HOME/.nvm" ]; then
    echo "[1/3] nvm をダウンロードしてインストールしています..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash
else
    echo "[1/3] nvm は既にインストールされています。スキップします。"
fi

# 2. 現在のシェルセッションに nvm をロードする
echo "[2/3] nvm 環境を現在のセッションに読み込んでいます..."
export NVM_DIR="$HOME/.nvm"
# nvm.sh が存在することを確認して読み込む
if [ -s "$NVM_DIR/nvm.sh" ]; then
    \. "$NVM_DIR/nvm.sh"
else
    echo "エラー: nvm.sh が見つかりません。" >&2
    exit 1
fi

# 3. Node.js (v24) のインストール
echo "[3/3] Node.js v24 をインストールしています..."
nvm install 24

# nvm でインストールした Node.js をデフォルトとして設定
nvm alias default 24
nvm use default

echo "----------------------------------------"
echo "インストールが完了しました！ バージョンを確認します："
echo -n "Node.js: " && node -v
echo -n "npm:     " && npm -v
echo "----------------------------------------"
echo "※ 新しいターミナルを開くか、'exec \$SHELL -l' を実行すると現在のターミナルにも反映されます。"