#!/bin/bash

echo "----------------------------------------"
echo " Keycloak / Docker コンテナ操作メニュー"
echo "----------------------------------------"
echo "1 通常のコンテナを起動"
echo "2 カスタム済みのコンテナを起動"
echo "3 すべて削除"
echo "----------------------------------------"
read -p "番号を入力してください (1-3): " choice

case "$choice" in
    1)
        echo "通常のコンテナを起動します..."
        docker compose up -d && watch 'docker ps -a'
        ;;
    2)
        echo "カスタム済みのコンテナを起動します..."
        docker compose -f docker-compose_custom_theme.yml up -d && watch 'docker ps -a'
        ;;
    3)
        echo "すべてのコンテナ・イメージ・ボリュームを削除します..."
        docker compose down --rmi all --volumes --remove-orphans
        ;;
    *)
        echo "エラー: 1, 2, 3 のいずれかを入力してください。"
        exit 1
        ;;
esac