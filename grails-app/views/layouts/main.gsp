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
        <div class="sidebar">
            <header>Menu</header>
            <g:link controller="dashboard" action="index" params="${[customerId: customer.id]}">
                <i class="fas fa-qrcode"></i>
                <span>Dashboard</span>
            </g:link>
            <g:link controller="customer" action="show" params="${[customerId: customer.id]}">
                <i class="fas fa-link"></i>
                <span>Meus dados</span>
            </g:link>
            <g:link controller="payer" action="create" params="${[customerId: customer.id]}">
                <i class="fas fa-stream"></i>
                <span>Cadastrar cliente</span>
            </g:link>
           <g:link controller="payment" action="create" params="${[customerId: customer.id]}">
                <i class="fas fa-calendar"></i>
                <span>Criar Cobrança</span>
            </g:link>
            <a href="#">
                <i class="fas fa-question-circle"></i>
                <span>Sobre</span>
            </a>
            <a href="#">
                <i class="fas fa-sliders-h"></i>
                <span>Serviços</span>
            </a>
            <a href="#">
                <i class="fas fa-envelope"></i>
                <span>Contato</span>
            </a>
        </div>
        <div>
          <g:layoutBody />
        </div>
    <footer>
      <h6 class="center">RocketCharger® 2022 - Todos os direitos reservados</h6>
    </footer>
  </body>
</html>
