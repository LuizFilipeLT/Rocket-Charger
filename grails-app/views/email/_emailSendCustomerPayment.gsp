<%@ page import="com.rocketcharger.utils.FormatDateUtils" %>
<html>
<head>
    <title>Email de cobrança</title>
</head>
<body>
    <p>Olá, ${payment.customer.name}.</p>
    <p>${payment.customer.name} sua cobrança no valor de R$ ${payment.value} com vencimento em <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/> foi gerada com sucesso.</p>
</body>
</html>
