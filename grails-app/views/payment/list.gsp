<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Gerenciamento de pagamentos</title>
</head>
<body>
    
    <div>
        <g:link controller="customer" action="list" params="${[customerId: customerId]}" update="divForm">Pagina inicial</g:link>
    </div>

    <div id="divLista">
        <g:render template="list" model="[paymentList: paymentList]"></g:render>
    </div>
    <div id="divForm"></div>
  <g:paginate total="${totalCount}" controller="payment" action="list" params="${[customerId: customerId]}" next="Próximo" prev="Anterior" max="9" />

</body>
</html>