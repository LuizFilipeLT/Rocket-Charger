<html>
<head>
    <title>Gerenciamento de pagamentos</title>
     <asset:javascript src="applications/applicationForm.js" />
</head>
<body>
    <form autocomplete="off" class="form" data-redirect-url="${g.createLink(controller: 'payer', action: 'index', params: [id: payer.customer.id])}" 
          action="${g.createLink(controller: 'payer', action: 'update')}" >
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

        <div class="form-control">
          <label for="cpfCnpj">CPF/CNPJ *</label>
          <input
            type="number"
            id="cpfCnpj"
            name="cpfCnpj"
            placeholder="Preencha seu CPF/CNPJ"
            value="${payer?.cpfCnpj}" 
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control">
          <label for="email">Email *</label>
          <input type="email" 
          id="email" 
          name="email"
          placeholder="Ex: meuemail@provedor.com"
          value="${payer?.email}"
          readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control">
          <label for="postalCode">CEP *</label>
          <input
            type="text"
            id="postalCode"
            name="postalCode"
            placeholder="Digite o seu CEP"
            maxlength="8"
            value="${payer?.postalCode}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control">
          <label for="address">Endereço</label>
          <input
            type="text"
            id="address"
            name="address"
            placeholder="Digite o seu endereço residêncial"
            value="${payer?.address}"
            readonly
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control">
          <label for="complement">Complemento</label>
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
          <label for="district">Bairro *</label>
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

        <div class="form-control">
          <label for="city">Cidade *</label>
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

        <div class="form-control">
          <label for="state">Estado *</label>
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
        <button class="js-edit">Editar</button>
        <button type="submit" class="js-send-button hiddenBtn">Salvar</button>
        <button type="reset">Cancelar</button>
</body>
</html>