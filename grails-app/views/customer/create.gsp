<html>
    <head>
        <title>Create customer</title>
        <asset:javascript src="application.js"/>
    </head>
    <body>
        <form data-redirect-url="${ g.createLink(controller: 'customer', action: 'index') }" 
              action="${ g.createLink(controller: 'customer', action: 'save') }"> 
            <div><input type="text" name="name" id="name" placeholder="Ex: João Da Silva" required></div>
            <div><input type="email" name="email" placeholder="Ex: email@meuprovedor.com" required></div>
            <div><input type="text" name="cpfCnpj" placeholder="Informe o CPF/CNPJ" required></div>
            <div><input type="text" name="postalCode" id="postalCode" placeholder="CEP" required></div>
            <div><input type="text" name="address" id="address" placeholder="Endereço" required></div>
            <div><input type="text" name="district" id="district" placeholder="Bairro" required></div>
            <div><input type="text" name="city" id="city" placeholder="Cidade" required></div>
            <div><input type="text" name="state" id="state" placeholder="Estado" required></div>
            <button type="submit">Criar</button>
            <button type="reset" class="js-cancel-button">Cancelar</button>
        </form>
    </body>
</html>
