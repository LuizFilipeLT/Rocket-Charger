<html>
<head>
    <asset:javascript src="applications/applicationRegisterLoginAndLogout.js"/>
    <title><g:message code='springSecurity.login.title'/></title>
</head>
<body>
  <h2>Acesso ao RocketCharger</h2>
  <p>Olá, use os campos abaixo para acessar sua conta RocketCharger.</p>
  <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
    <div>
      <label for="username">Informe seu e-mail</label>
      <input type="text" name="${usernameParameter ?: 'username'}" id="username" autocapitalize="none"/>
    </div>
    <div>
      <label for="password">Informe sua senha</label>
      <input type="password" name="${passwordParameter ?: 'password'}" id="password"/>
      <i id="passwordToggler" title="toggle password display" onclick="passwordDisplayToggle()">&#128065;</i>
    </div>
    <button id="login" type="submit">Acessar sua conta</button>
    <hr>
    <p>Ainda não tem uma conta? <g:link controller="register">Registre-se</g:link></p>
  </form>
</body>
</html>