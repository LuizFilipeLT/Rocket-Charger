<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Gerenciamento de pagamentos</title>
</head>
<body>
    
    <div>
        <g:link controller="customer" action="customerPage" update="divForm" params='${customerId}'>Pagina inicial</g:link>
    </div>

    <div id="divLista">
        <g:render template="list" model="[payerList: payerList]"></g:render>
    </div>
    
    <div id="divForm">
    <g:paginate total="${totalCount}" controller="payer" action="index" params="${params}" next="Próximo" prev="Anterior" max="3" />
    </div>

</body>
</html>