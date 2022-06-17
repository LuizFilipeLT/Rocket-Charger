<html>
<head>
    <title>Register</title>
    <asset:javascript src="applications/applicationRegisterLoginAndLogout.js"/>
    <asset:stylesheet src="authAndRegister/register.css"/>
</head>
<body>
    <form action="register" method="POST" id="loginForm" autocomplete="off">
      <asset:image src="simbolo-asaas-azul.png" alt="logo" id="logo"/>
      <h2>Criar sua Conta</h2>
      <p>Crie uma senha para acessar sua conta junto ao email cadastrado.</p>
      <div class="form-control">
        <label for="username">email</label>
        <input id="form-control-user" class="form-control-input" type="email" name="username" id="username" autocapitalize="none"/>
      </div>

      <div class="form-control">
        <label for="password">Senha</label>
        <input id="form-control-password" class="form-control-input" type="password" name="password" id="password" required/>
      </div> 
       
      <div class="form-control">
        <label for="password">Confirmar senha</label>
        <input id="form-control-password" class="form-control-input" type="password" name="repassword" id="repassword" required/>
      </div>
      <div>
        <input type="checkbox" class="checkRegister" required>Li e concordo com os <a  class="checkRegister" href=https://ajuda.asaas.com/pt-BR/articles/102021-termos-e-condicoes-de-uso>Termos de Uso do RocketCharger</a>
      </div>
      <button id="register" type="submit">Criar conta</button>
      <hr>
      <p>Já tem uma conta? <g:link controller="login" action="auth">entre aqui</g:link></p>
  </form>
</body>
</html>