<html>
<head>
    <title>Email de cobrança</title>
</head>
<body>
    <p>Olá ${payment.payer.name}, uma cobrança foi gerada para você</p>
    <p>${payment.customer.name} gerou uma cobrança para você, no valor de R$ ${payment.value} com vencimento em ${payment.dueDate}.</p>
</body>
</html>