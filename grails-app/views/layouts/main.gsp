<!DOCTYPE html>
<html lang="pt-BR">
  <head>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <asset:link rel="icon" href="rocketico.png" type="image/x-ico" />
    <asset:stylesheet src="nav-bar.css" />
    <asset:stylesheet src="application.css" />
    <g:layoutHead />
  </head>
  <body>
        <g:render template="/utils/sidebar" model="[customer: customer]" />
        <div class="container-body">
          <g:layoutBody/>
        <div>
    <footer>
      <h6 class="center">RocketCharger® 2022 - Todos os direitos reservados</h6>
    </footer>
  </body>
</html>
