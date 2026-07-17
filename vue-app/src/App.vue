<script setup>
const handleLogout = () => {
  // OAuth2-Proxyのログアウトエンドポイント
  const proxySignOutUrl = 'http://localhost:3000/oauth2/sign_out';
  // ログアウト後に戻したいVueアプリのURL
  const appUrl = 'http://localhost:3000';

  // ログアウトさせてからVueアプリのトップにリダイレクト
  window.location.href = `${proxySignOutUrl}?rd=${encodeURIComponent(appUrl)}`;
};
</script>

<template>
  <h1>Oauth2-proxy&keycloak test pagev2</h1>
  <button @click="handleLogout" class="logout-btn">
      ログアウトする
  </button>
</template>

<style>
.logout-btn {
  background-color: #e53e3e;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
}
.logout-btn:hover {
  background-color: #c53030;
}
</style>