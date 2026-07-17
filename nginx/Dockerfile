FROM nginx:alpine

# 作成した default.conf をコンテナ内の正しい場所にコピー
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]