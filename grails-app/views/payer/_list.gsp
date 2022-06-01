<html lang="pt-br">
  <body>
    <g:if test="${payerList}">
      <table>
        <tr>
          <th>Nome</th>
          <th>CPF/CNPJ</th>
          <th>E-mail</th>
          <th>CEP</th>
          <th>Endereço</th>
          <th>Bairro</th>
          <th>Cidade</th>
          <th>Estado</th>
        </tr>
        <g:each var="payer" in="${payerList}">
          <tr>
            <td>${payer.name}</td>
            <td>${payer.cpfCnpj}</td>
            <td>${payer.email}</td>
            <td>${payer.postalCode}</td>
            <td>${payer.address}</td>
            <td>${payer.district}</td>
            <td>${payer.city}</td>
            <td>${payer.state}</td>
            <td>
             <g:link controller="payer" action="show" update="divForm" id="${payer.id}">Editar dados</g:link>
            </td>
            <td>
              <g:link controller="payer" action="show" update="divForm" id="${payer.id}">Excluir</g:link>
            </td>
            </td>
          </tr>
        </g:each>
      </table>
    </g:if>
    <g:else>
      <div><strong>Não há pagadores.</strong></div>
    </g:else>
  </body>
</html>
