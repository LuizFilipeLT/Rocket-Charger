<head>
    <meta name="layout" content="main" />
    <title>Meus pagadores</title>
  </head>
  <body>
    <table>
      <thead>
        <tr>
          <th>Nome</th>
          <th>CPF/CNPJ</th>
          <th>Email</th>
          <th>Telefone</th>
          <th></th>
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
            <a href="${ g.createLink([controller:"payer", action:"show", params:[payerId: customer.payer.payerId]])}">
            <button type="button">Editar</button>
            </a>
            </td>
          </tr>
        </g:each>
      </tbody>
    </table>
    <div>
    <a
      href="${ g.createLink([controller:"customer", action:"show", params:[customerId: customerId]])}"
      ><button>Voltar</button></a>
      <g:paginate total="${totalCount}" controller="payer" action="list" params="${params}" next="Próxima" prev="Anterior" max="9"/>
    </div>
  </body>