<html>
<head>
    <title>Gerenciamento de pagamentos</title>
</head>
    <asset:javascript src="applications/applicationForm.js"/>
<body>
    <form data-redirect-url="${ g.createLink(controller: 'payment', action: 'index') }" 
          action="${ g.createLink(controller: 'payment', action: 'update') }" >
        <input type="hidden" class="js-payment-id" name="id" value="${payment.id}">
        <input type="text" name="value" placeholder="valor do pagamento" required><br>
        <input type="text" name="billingType" placeholder="Método de pagamento" required><br>
        <input type="text" name="status" placeholder="Status" required><br>
        <input type="date" name="dueDate" placeholder="Data de vencimento" required><br>
        <button class="js-editPayer">Editar</button>
        <button type="submit" class="js-send-button hiddenBtn">Salvar</button>
    </form> 
</body>
</html>