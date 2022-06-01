<html>
<head>
    <title><g:message code='springSecurity.login.title'/></title>
</head>
<body>
            <h5>Login</h5>
            <form class="form-signin" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm">
            <div><input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username"/></div>
            <div>
              <input type="password" class="form-control" name="${passwordParameter ?: 'password'}" id="password"/>
              <i id="passwordToggler" title="toggle password display" onclick="passwordDisplayToggle()">&#128065;</i>
            </div>
              <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Entrar</button>
              <p><g:link controller="register">Criar nova conta</g:link></p>
            </form>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function(event) {
            document.forms['loginForm'].elements['username'].focus();
        });
        function passwordDisplayToggle() {
            var toggleEl = document.getElementById("passwordToggler");
            var eyeIcon = '\u{1F441}';
            var xIcon = '\u{2715}';
            var passEl = document.getElementById("password");
            if (passEl.type === "password") {
                toggleEl.innerHTML = xIcon;
                passEl.type = "text";
            } else {
                toggleEl.innerHTML = eyeIcon;
                passEl.type = "password";
            }
        }
    </script>
</body>
</html>