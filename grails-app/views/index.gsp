 <html> 
  <head>
    <meta name="layout" content="main"/>
        <script src="https://kit.fontawesome.com/c8d140aaae.js" crossorigin="anonymous"></script>
        <asset:link rel="icon" href="rocketico.png" type="image/x-ico"/>
        <asset:stylesheet src="index/style.css"/>
        <asset:javascript src="applications/applicationForm.js"/>
    <title>Cadastro RocketCharger</title>
  </head>
  <body>

    <div class="container">
      <div class="header">
        <h2>Crie sua conta, é grátis!</h2>
      </div>

      <form autocomplete="off" class="form" >
        <div class="form-control">
          <label for="name">Nome Completo: *</label>
          <input
            type="text"
            id="name"
            name="name"
            placeholder="Ex: João da Silva"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two left">
          <label for="cellphone">Celular *</label>
          <input
            type="tel"
            id="cellphone"
            name="cellphone"
            placeholder="Informe seu número de contato"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two">
          <label for="cpfCnpj">CPF/CNPJ *</label>
          <input
            type="number"
            id="cpfCnpj"
            name="cpfCnpj"
            placeholder="Preencha seu CPF/CNPJ"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control two">
          <label for="email">Email *</label>
          <input type="email" id="email" name="email"
          placeholder="Ex: meuemail@provedor.com"/>
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control two left">
          <label for="postalCode">CEP *</label>
          <input
            type="text"
            id="postalCode"
            name="postalCode"
            placeholder="Digite o seu CEP"
            maxlength="8"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control two">
          <label for="address">Endereço *</label>
          <input
            type="text"
            id="address"
            name="address"
            placeholder="Digite o seu endereço residencial"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control two left">
          <label for="addressNumber">Número *</label>
          <input
            type="text"
            id="addressNumber"
            name="addressNumber"
            placeholder="Informe o número de sua residência"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two">
          <label for="complement">Complemento</label>
          <input
            type="text"
            id="complement"
            name="complement"
            placeholder="Informe um complemento (opcional)"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
        </div>

        <div class="form-control two left">
          <label for="district">Bairro *</label>
          <input
            type="text"
            id="district"
            name="district"
            placeholder="Informe o seu bairro"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two">
          <label for="city">Cidade *</label>
          <input
            type="text"
            id="city"
            name="city"
            placeholder="Informe a sua cidade"
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control two left">
          <label for="state">Estado *</label>
          <input
            type="text"
            id="state"
            name="state"
            placeholder="Informe o seu estado"        
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <button type="submit" id="button">
          <strong>Enviar formulário</strong>
        </button>
      </form>
    </div>
  </body>
</html>
