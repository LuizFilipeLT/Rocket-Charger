<html>
<head>
    <asset:javascript src="applications/applicationRegisterLoginAndLogout.js"/>
    <asset:stylesheet src="authAndRegister/auth.css"/>
    <title>Login></title>
</head>
<body>
  <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
  <asset:image src="simbolo-asaas-azul.png" alt="logo" id="logo"/>
  <h2>Acesso ao RocketCharger</h2>
  <p>Olá, use os campos abaixo para acessar sua conta RocketCharger.</p>
    <div class="form-control">
      <label for="username">Email</label><br>
      <input id="form-control-user" class="form-control-input" type="text" name="${usernameParameter ?: 'username'}" id="username" placeholder="Informe seu e-mail" autocapitalize="none"/>
    </div>
    <div class="form-control">
      <label for="password">Senha</label><br>
      <input id="form-control-password" class="form-control-input" type="password" name="${passwordParameter ?: 'password'}" id="password" placeholder="Informe sua senha"/>
    </div>
    <button id="login" type="submit"><strong>Acessar sua conta</strong></button>
    <hr>
    <p>Ainda não tem uma conta? 
      <a href="register/index"> 
        <strong>Criar uma conta</strong>
      </a>
    </p>
  </form>
</body>
</html>