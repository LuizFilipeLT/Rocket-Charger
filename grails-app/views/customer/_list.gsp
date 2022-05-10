<html lang="pt-br">
<body>
<g:if test="${customerList?.size() > 0}">
    <table>
    <tr>  
        <th>Nome</th>
        <th>E-mail</th>
        <th>CPF/CNPJ</th>
        <th>CEP</th>
        <th>Endereço</th>
        <th>Bairro</th>
        <th>Cidade</th>
        <th>Estado</th>
    </tr>
    <g:each var="customer" in="${customerList}">
        <tr>
          <td>${customer.name}</td>
          <td>${customer.email}</td>
          <td>${customer.cpfCnpj}</td>
          <td>${customer.postalCode}</td>
          <td>${customer.address}</td>
          <td>${customer.district}</td>
          <td>${customer.city}</td>
          <td>${customer.state}</td>
            <td>
             <g:link controller="customer" action="show" update="divForm" id='${customer.id}'>editar dados</g:link>
            </td>
        </tr>
        </g:each>
    </table>
    </g:if>
    <g:else>
      <div><strong>Não há registros.</strong></div>
    </g:else>
</body>
</html>