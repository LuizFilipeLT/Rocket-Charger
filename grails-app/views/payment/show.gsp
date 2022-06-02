<html>
   <head>
      <title>Gerenciamento de pagamentos</title>
   </head>
   <body>
      <form
      data-redirect="${ g.createLink(controller: "payment", action: "list") }"
      data-url="${ g.createLink(controller: "payment", action: "update") }">
      <input
         type="hidden"
         class="js-payment-id"
         name="id"
         value="${payment.id}"/>
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
      </form>
      <a href="${ g.createLink(controller: "payment", action: "index", id: payment.id)}">
      Voltar
      </a>
   </body>
</html>