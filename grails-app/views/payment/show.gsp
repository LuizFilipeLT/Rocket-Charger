   <head>
      <meta name="layout" content="main" />
      <title>Visualização de Cobrança</title>
   </head>
   <body>

      <input
         type="hidden"
         name="id"
         value="${payment.payerId}"/>

      <div>
         <h4>Valor: ${payment.value}</h4>
      </div>

      <div>
         <h4>
            Método de Pagamento:
            <g:message code="PaymentMethod.${payment.billingType}" />
         </h4>
      </div>

      <div>
         <h4>
            Status da Cobrança:
            <g:message code="PaymentStatus.${payment.status}" />
         </h4>
      </div>

      <div>
         <h4>
            Data de Pagamento:
            <g:formatDate format="dd/MM/yyyy" type="dateTime" style="SHORT" date="${payment.paymentDate}" />
         </h4>
      </div>

      <div>
         <h4>
            Data de Vencimento:
            <g:formatDate format="dd/MM/yyyy" date="${payment?.dueDate}" />
         </h4>
      </div>

      <div>
         <h4>Nome do Pagador: ${payment.payer.name}</h4>
      </div>

      <a href="${ g.createLink(controller: "payment", action: "list", params: [customerId: payment.customerId])}">Voltar</a>
   </body>
</html>