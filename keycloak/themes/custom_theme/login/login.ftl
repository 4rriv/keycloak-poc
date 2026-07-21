<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password'); section>
    <#if section = "header">
        <#--  1. 一番上に Realmの名前を <h1> で表示  -->
        <h1>これはテーマをカスタム済みの</h1>
        <h1>${realm.displayName!realm.name}</h1>
        <h1>へのログイン画面です</h1>

    <#elseif section = "form">
        <#--  ログインフォーム  -->
        <form id="kc-form-login" action="${url.loginAction}" method="post">

            <#--  2. ユーザーネームと入力ボックス  -->
            <div style="margin-bottom: 15px;">
                <label for="username" style="display: block; margin-bottom: 5px;">ユーザーネーム</label>
                <input id="username" name="username" value="${(login.username!'')}" type="text" autofocus style="width: 100%; padding: 8px;" />
            </div>

            <#--  3. パスワードと入力ボックス  -->
            <div style="margin-bottom: 15px;">
                <label for="password" style="display: block; margin-bottom: 5px;">パスワード</label>
                <input id="password" name="password" type="password" style="width: 100%; padding: 8px;" />
            </div>

            <#--  4. ログインボタン  -->
            <div>
                <input type="submit" value="ログイン" style="width: 100%; padding: 10px; cursor: pointer;" />
            </div>

        </form>
    </#if>
</@layout.registrationLayout>