<html>
<head>
  <meta name="layout" content="main"/>
    <title>Visualização de Dados</title>
  <asset:javascript src="applications/applicationForm.js" />
  <asset:stylesheet src="index/style.css"/>
  <asset:stylesheet src="customer/show.css" />
</head>
<body>
  <div class="container">
    <div class="header">
          <h2>Dados de ${payer.name}</h2>
      </div>

    <form 
        autocomplete="off"
        class="form"
        data-redirect="${ g.createLink(controller: "payer", action: "index", params: [id: payer.customer.id]) }" 
        data-url="${ g.createLink(controller: "payer", action: "update") }" >
        <input type="hidden" class="js-payer-id" name="id" value="${payer?.id}">
        
        <div class="form-control">
          <label for="name">Nome Completo: *</label>
          <input
            type="text"
            id="name"
            name="name"
            placeholder="Ex: João da Silva"
            value="${payer?.name}" 
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two left">
          <label for="number">Celular *</label>
          <input
            type="tel"
            id="number"
            name="number"
            placeholder="Informe seu número de contato"
            value="${payer?.phone}" 
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
        </div>

        <div class="form-control two">
          <label for="cpfCnpj">CPF/CNPJ: *</label>
          <input
            type="number"
            id="cpfCnpj"
            name="cpfCnpj"
            placeholder="Informe seu CPF/CNPJ"
            value="${payer?.cpfCnpj}" 
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control two left">
          <label for="email">Email: *</label>
          <input type="email" 
          id="email" 
          name="email"
          placeholder="Informe seu email"
          value="${payer?.email}"
          readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control two">
          <label for="postalCode">CEP: *</label>
          <input
            type="text"
            id="postalCode"
            name="postalCode"
            placeholder="Informe o seu CEP"
            maxlength="8"
            value="${payer?.postalCode}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control two left">
          <label for="address">Endereço: </label>
          <input
            type="text"
            id="address"
            name="address"
            placeholder="Informe o seu endereço residencial"
            value="${payer?.address}"
            readonly
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
            value="${payer?.addressNumber}"
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
            value="${payer?.district}"
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
            value="${payer?.city}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control two left">
          <label for="state">Estado: *</label>
          <input
            type="text"
            id="state"
            name="state"
            placeholder="Informe o seu estado"
            value="${payer?.state}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>
          <button class="js-edit" id="button">Editar</button>
          <button type="submit" class="js-send-button hide">Salvar</button>
          <button type="reset" id="button">Cancelar</button>
        </form>
  </div>
</body>
</html>