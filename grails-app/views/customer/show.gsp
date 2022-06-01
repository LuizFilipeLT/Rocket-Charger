<html>
  <head>
    <title>Create customer</title>
    <asset:stylesheet src="customer/show.css" />
    <asset:javascript src="applications/applicationForm.js" />
  </head>
  <body>
    <div class="container">
      <form
        autocomplete="off"
        class="form"
        data-redirect="${ g.createLink(controller: "customer", action: "customerPage") }"
        data-url="${ g.createLink(controller: "customer", action: "update") }"
      >
        <input
          type="hidden"
          class="js-customer-id"
          name="id"
          value="${customer?.id}"
        />

        <div class="form-control">
          <label for="name">Nome Completo: *</label>
          <input
            type="text"
            id="name"
            name="name"
            placeholder="Ex: João da Silva"
            value="${customer?.name}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control">
          <label for="cpfCnpj">CPF/CNPJ: *</label>
          <input
            type="number"
            id="cpfCnpj"
            name="cpfCnpj"
            placeholder="Preencha seu CPF/CNPJ"
            value="${customer?.cpfCnpj}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control">
          <label for="email">Email: *</label>
          <input
            type="email"
            id="email"
            name="email"
            placeholder="Ex: meuemail@provedor.com"
            value="${customer?.email}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control">
          <label for="postalCode">CEP: *</label>
          <input
            type="text"
            id="postalCode"
            name="postalCode"
            placeholder="Digite o seu CEP"
            maxlength="8"
            value="${customer?.postalCode}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control">
          <label for="address">Endereço: *</label>
          <input
            type="text"
            id="address"
            name="address"
            placeholder="Digite o seu endereço residencial"
            value="${customer?.address}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control">
          <label for="complement">Complemento: </label>
          <input
            type="text"
            id="complement"
            name="complement"
            placeholder="Informe um complemento (opcional)"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
        </div>

        <div class="form-control">
          <label for="district">Bairro: *</label>
          <input
            type="text"
            id="district"
            name="district"
            placeholder="Informe o seu bairro"
            value="${customer?.district}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control">
          <label for="city">Cidade: *</label>
          <input
            type="text"
            id="city"
            name="city"
            placeholder="Informe a sua cidade"
            value="${customer?.city}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control">
          <label for="state">Estado: *</label>
          <input
            type="text"
            id="state"
            name="state"
            placeholder="Informe o seu estado"
            value="${customer?.state}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>
        <button class="js-edit">Editar</button>
        <button type="submit" class="js-send-button hide">Salvar</button>
        <button type="reset">Cancelar</button>
      </form>
    </div>
    <div>
      <g:link controller="payer" action="create" id="${customer.id}"
        ><button>Criar pagador</button></g:link>
    </div>
  </body>
</html>
