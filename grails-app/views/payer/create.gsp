<html>
  <head>
    <title>Adicionar um cliente</title>
    <asset:javascript src="application.js" />
    <meta name="layout" content="main">
  </head>
  <body>
    <form action="${ g.createLink(controller: 'payer', action: 'save') }">
      <input type="text" name="name" placeholder="Nome" /><br />
      <input type="text" name="email" placeholder="E-mail" /><br />
      <input type="date" name="nascimento" placeholder="Data de nascimento"/><br />
      <input type="text" name="cep" placeholder="CEP" /><br />
      <input type="text" name="endereco" placeholder="Endereço" /><br />
      <input type="text" name="cidade" placeholder="Cidade" /><br />
      <input type="text" name="estado" placeholder="UF" /><br />
      <button type="submit" name="btnSalvar">Salvar</button>
      <br />
      <button type="button" name="btnCancelar">Cancelar</button>
    </form>
  </body>
</html>
