<html lang="pt-br">
<head>
        <script
      src="https://kit.fontawesome.com/c8d140aaae.js"
      crossorigin="anonymous"
    ></script>
        <title>Adicionar pagador</title>
    <asset:stylesheet src="index/style.css" />
    <asset:javascript src="applications/applicationForm.js"/>
</head>
        <div class="container">
        <form autocomplete="off" class="form" data-redirect="${ g.createLink(controller: "payer", action: "index", params: [id: customerId])}"
              data-url="${ g.createLink(controller: "payer", action: "save") }">  

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

        <div class="form-control">
          <label for="cpfCnpj">CPF/CNPJ: *</label>
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

        <div class="form-control">
          <label for="email">Email: *</label>
          <input type="email" id="email" name="email"
          placeholder="Ex: meuemail@provedor.com"/>
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control">
          <label for="postalCode">CEP: *</label>
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

        <div class="form-control">
          <label for="address">Endereço: *</label>
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

        <div class="form-control">
          <label for="complement">Complemento: </label>
          <input
            type="text"
            id="complement"
            name="complement"
            placeholder="Informe um complemento (opcional)"
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
          />
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg
          "></small>
        </div>

        <div class="form-control">
          <label for="state">Estado: *</label>
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
            <input hidden value="${customerId}" name="customer" id="customer">
            <button type="submit">Salvar</button>
        </form>
        </div>
    </body>
</html>
