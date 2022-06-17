<html>
<head>
    <title>Register</title>
    <asset:javascript src="applications/applicationRegisterLoginAndLogout.js"/>
</head>
<body>
    <div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
      <div class="card card-signin my-5">
        <div class="card-body">
          <h5 class="card-title text-center">Register Here</h5>
                    <g:if test='${flash.message}'>
                        <div class="alert alert-danger" role="alert">${flash.message}</div>
                    </g:if>
              <form class="form-signin" action="register" method="POST" id="loginForm" autocomplete="off">
            <div class="form-group">
                    <label for="username">Email</label>
              <input type="text" class="form-control" name="username" id="username" autocapitalize="none"/>
            </div>

      <div>
        <label for="password">Senha</label>
        <input type="password" name="password" id="password" required/>
      </div>

      <div>
        <label for="password">Confirmar senha</label>
        <input type="password" name="repassword" id="repassword" required/>
      </div>
      <div>
        <input type="checkbox" id="checkRegister" required>Li e concordo com os <a href=https://ajuda.asaas.com/pt-BR/articles/102021-termos-e-condicoes-de-uso>Termos de Uso do RocketCharger</a>
      </div>
      <button id="submit" type="submit">Criar conta</button>
      <hr>
      <p>Já tem uma conta? <g:link controller="login" action="auth">entre aqui</g:link></p>
  </form>
</body>
</html>