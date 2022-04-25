  <head>
        <script
      src="https://kit.fontawesome.com/c8d140aaae.js"
      crossorigin="anonymous"
    ></script>
  <asset:link rel="icon" href="rocketico.ico" type="image/x-ico"/>
  <asset:stylesheet src="index/style.css" />
    <title>Cadastro RocketCharger</title>
  </head>

  <body>
    <div class="container">
      <div class="header">
        <h2>Crie sua conta, é grátis!</h2>
        <asset:image src="rocketico.ico" alt="Imagem com a letra A e duas asas ao seus lados representando a logo em fundo azul e letra na cor branca" />
      </div>

      <form id="form" class="form">
        <div class="form-control">
          <label for="cName">Nome Completo: *</label>
          <input
            type="text"
            id="cName"
            placeholder="Ex: João da Silva"
            autocomplete="off"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small></small>
        </div>

        <div class="form-control">
          <label for="cpfCnpj">CPF/CNPJ *</label>
          <input
            type="text"
            id="cpfCnpj"
            placeholder="Preencha seu CPF/CNPJ"
            autocomplete="off"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small></small>
        </div>

        <div class="form-control">
          <label for="cellphone">Seu Telefone com DDD *</label>
          <input type="text" id="cellphone" placeholder="Ex: 11 98765-4321" autocomplete="off" />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small></small>
        </div>

        <div class="form-control">
          <label for="email">Email *</label>
          <input type="email" id="email" 
          placeholder="Ex: meuemail@provedor.com" 
          autocomplete="off"/>
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small></small>
        </div>

        <div class="form-control">
          <label for="postalCode">CEP *</label>
          <input
            type="number"
            id="postalCode"
            placeholder="Digite o seu CEP"
            autocomplete="off"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small></small>
        </div>

        <div class="form-control">
          <label for="address">Endereço</label>
          <input
            type="text"
            id="address"
            placeholder="Digite o seu endereço residêncial"
            disabled
            autocomplete="off"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small></small>
        </div>

        <div class="form-control">
          <label for="houseNumber">Número *</label>
          <input
            type="text"
            id="houseNumber"
            placeholder="Informe o número de sua residência"
            autocomplete="off"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small></small>
        </div>

        <div class="form-control">
          <label for="complement">Complemento</label>
          <input
            type="text"
            id="complement"
            placeholder="Informe um complemento (opcional)"
            autocomplete="off"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
        </div>

        <div class="form-control">
          <label for="province">Bairro *</label>
          <input
            type="text"
            id="province"
            placeholder="Informe o seu bairro"
            disabled
            autocomplete="off"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small></small>
        </div>

        <div class="form-control">
          <label for="city">Cidade *</label>
          <input
            type="text"
            id="city"
            placeholder="Informe a sua cidade"
            disabled
            autocomplete="off"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small></small>
        </div>

        <div class="form-control">
          <label for="state">Estado *</label>
          <input
            type="text"
            id="state"
            placeholder="Informe o seu estado"
            disabled
            autocomplete="off"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small></small>
        </div>

        <button type="submit" id="button">
          <strong>Enviar formulário</strong>
        </button>
      </form>
    </div>
    <asset:javascript src="index/FormController.js"/>
    <asset:javascript src="index/postalCode-api.js"/>
  </body>
</html>