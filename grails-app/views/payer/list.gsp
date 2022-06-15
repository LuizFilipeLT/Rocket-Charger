<head>
    <asset:stylesheet src="list.css"/>
    <meta name="layout" content="main" />
    <title>Meus clientes</title>
  </head>
  <body>
  <utilsTagLib:header />
    <div class="container-body">
      <table>
        <thead>
          <tr>
            <th>Nome</th>
            <th>CPF/CNPJ</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>Edição</th>
          </tr>
        </thead>
        <tbody>
          <g:each var="payer" in="${ payerList }">
            <tr>
              <td>${payer.name}</td>
              <td id="cpfCnpj">${payer.cpfCnpj}</td>
              <td>${payer.email}</td>
              <td id="phone">${payer.phone}</td>
              <td>
              <g:link controller="payer" action="show" params="${[payerId: payer.id]}">
              <button type="button" role="button" class="button">Editar</button>
              </g:link>
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>
      <g:paginate total="${totalCount}" controller="payer" action="list" params="${params}" next="Próxima" prev="Anterior" max="9"/>
    </div>
  </body>