<%@ page contentType="text/html" %>
<%@ page import="com.rocketcharger.utils.FormatDateUtils" %>
<html>
<head>
    <title>Email de cobrança</title>
</head>
<body>
    <p>Olá ${payment.payer.name}, uma cobrança foi gerada para você</p>
    <p>${payment.customer.name} gerou uma cobrança para você, no valor de <format:monetarySymbol number="${payment.value}"/> com vencimento em <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/>.</p>
</body>
</html>