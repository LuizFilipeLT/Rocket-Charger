<html>
<head>
    <title>Register</title>
    <asset:javascript src="applications/applicationRegisterAndLogin.js"/>
</head>
  <body>
    <h5>Cadastre-se</h5>
    <form class="form-signin" action="register" method="POST" id="loginForm" autocomplete="off">
      <div>
        <label for="role">Cargo</label>
        <g:select class="form-control" name="role.id"
            from="${com.rocketcharger.domain.role.Role.list()}"
            optionKey="id" />
      </div>
      <div>
        <label for="username">Nome</label>
        <input type="text" placeholder="Seu nome" class="form-control" name="username" id="username" autocapitalize="none"/>
      </div>
      <div>
        <label for="password">Senha</label>
        <input type="password" placeholder="Sua senha" class="form-control" name="password" id="password"/>
      </div>
      <div>
        <label for="password">Confirme sua senha</label>
        <input type="password" placeholder="Confirme sua senha" class="form-control" name="repassword" id="repassword"/>
      </div>
      <div>
        <label for="username">Nome completo</label>
        <input type="text" placeholder="Nome completo" class="form-control" name="fullname" id="fullname" autocapitalize="none"/>
      </div>
      <button type="submit">Register</button>
      <p>Já tem uma conta? <g:link controller="login" action="auth">Login</g:link></p>
    </form>
  <script type="text/javascript">
  document.addEventListener("DOMContentLoaded", function(event) {
      document.forms['loginForm'].elements['username'].focus();
  });
  </script>
  </body>
</html>