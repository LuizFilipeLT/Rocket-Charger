<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Gerenciamento da conta</title>
</head>
<body>
    
    <div>
        <g:link controller="customer" action="create" update="divForm">Criando conta</g:link>
    </div>

    <div id="divLista">
        <g:render template="list" model="[customerList: customerList]"></g:render>
    </div>
    
    <g:paginate total="${totalCount}" controller="customer" action="index" params="${params}" next="Próximo" prev="Anterior" max="10" />
    <div id="divForm"></div>

</body>
</html>