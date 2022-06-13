<html>
  <head>
    <meta name="layout" content="main"/>
      <title>Visualização de Dados</title>
    <asset:stylesheet src="index/style.css" />
    <asset:stylesheet src="customer/show.css" />
    <asset:javascript src="applications/applicationForm.js" />
  </head>
  <body>
    <div class="container">
          <div class="header">
              <h2>Dados de ${customer.name}</h2>
          </div>

      <form
        autocomplete="off"
        class="form"
        data-redirect="${ g.createLink(controller: "customer", action: "list") }"
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
            placeholder="Informe seu nome completo"
            value="${customer?.name}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two left">
          <label for="phone">Celular *</label>
          <input
            type="tel"
            id="phone"
            name="phone"
            placeholder="Informe seu número de contato"
            value="${customer?.phone}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two">
          <label for="cpfCnpj">CPF/CNPJ: *</label>
          <input
            type="text"
            id="cpfCnpj"
            name="cpfCnpj"
            placeholder="Informe seu CPF/CNPJ"
            value="${customer?.cpfCnpj}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two left">
          <label for="email">Email: *</label>
          <input
            type="email"
            id="email"
            name="email"
            placeholder="Informe seu e-mail"
            value="${customer?.email}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two">
          <label for="postalCode">CEP: *</label>
          <input
            type="text"
            id="postalCode"
            name="postalCode"
            placeholder="Informe o seu CEP"
            value="${customer?.postalCode}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two left">
          <label for="address">Endereço: *</label>
          <input
            type="text"
            id="address"
            name="address"
            placeholder="Informe o seu endereço residencial"
            value="${customer?.address}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two left">
          <label for="addressNumber">Número *</label>
          <input
            type="text"
            id="addressNumber"
            name="addressNumber"
            placeholder="Informe o número de sua residência"
            value="${customer?.addressNumber}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two">
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

        <div class="form-control two left">
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

        <div class="form-control two">
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

        <div class="form-control two left">
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
        <g:render template="/customer/dashboard"/>   
        <button class="js-edit">Editar</button>
        <button type="submit" class="js-send-button hide">Salvar</button>
        <button type="reset" class="js-send-button hide">Cancelar</button>
      </form>
      <div>
        <g:link controller="payer" action="create" params="${[customerId: customer.id]}"><button class="btn ">Cadastrar cliente</button></g:link>
        <g:link controller="payer" action="index" params="${[customerId: customer.id]}"><button class="btn ">Meus clientes</button></g:link>
        <g:link controller="payment" action="list" params="${[customerId: customer.id]}"><button class="btn ">Minhas cobranças</button></g:link>
        <g:link controller="payment" action="create" params="${[customerId: customer.id]}"><button class="btn ">Nova Cobrança</button></g:link>
     </div>
    </div>
    <asset:javascript src="applications/applicationMasks.js" />
  </body>
</html>
