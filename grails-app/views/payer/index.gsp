<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <title>Gerenciamento de pagamentos</title>
</head>
<body>
    
    <div>
        <g:link controller="payer" action="create" update="divForm">Adicionar pagador</g:link>
    </div>

    <div id="divLista">
        <g:render template="list" model="[payerList: payerList]"></g:render>
    </div>

    <div id="divForm"></div>

</body>
</html>