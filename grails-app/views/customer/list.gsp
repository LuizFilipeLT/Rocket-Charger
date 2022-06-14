<head>
    <meta name="layout" content="main" />
    <title>Conta</title>
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
        <g:each var="customer" in="${ customerList }">
          <tr>
            <td>${customer.name}</td>
            <td id="cpfCnpj">${customer.cpfCnpj}</td>
            <td>${customer.email}</td>
            <td id="phone">${customer.phone}</td>
            <td>
            <a href="${ g.createLink([controller:"customer", action:"show", params:[customerId: customer.Id]]) }">
            <button type="button">Editar</button>
            </a>
            </td>
          </tr>
        </g:each>
      </tbody>
    </table>
    <div>
      <g:paginate total="${totalCount}" controller="customer" action="list" params="${params}" next="Próxima" prev="Anterior" max="9"/>
    </div>
    <g:if test="${customerId}">
    <a
      href="${ g.createLink([controller:"customer", action:"show", params:[customerId: customerId]]) }"
      ><button>Voltar</button></a>
    </g:if>
  </body>