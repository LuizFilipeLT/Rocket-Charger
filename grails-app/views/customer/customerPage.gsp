<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Conta</title>
    <asset:javascript src="applicationCustomer.js"/>
</head>
<body>
    <div id="divLista">
        <g:render template="list" model="[customerList: customerList]"></g:render>
    </div>
     <div id="divForm"></div>
</body>
</html>