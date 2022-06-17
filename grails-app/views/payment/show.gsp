<%@ page import="com.rocketcharger.enums.PaymentStatus" %>
   <head>
      <asset:stylesheet src="show-list.css" />
      <meta name="layout" content="main" />
      <title>Visualização de Cobrança</title>
   </head>
   <body>
   <utilsTagLib:header />
      <input
         type="hidden"
         name="id"
         value="${payment.payerId}"/>

      <div class="container">
         <div>
            <h4>Valor:
               <g:formatNumber number="${payment.value}" type="currency" currencyCode="BRL"/>
            </h4>
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

         <g:if test="${payment.status == PaymentStatus.PAID}">
         <div>
            <h4>
               Data de Pagamento:
               <g:formatDate format="dd/MM/yyyy" type="dateTime" style="SHORT" date="${payment.paymentDate}" />
            </h4>
         </div>
         </g:if>

         <div>
            <h4>
               Data de Vencimento:
               <g:formatDate format="dd/MM/yyyy" date="${payment?.dueDate}" />
            </h4>
         </div>

         <div>
            <h4>Nome do Pagador: ${payment.payer.name}</h4>
         </div>

         <g:if test="${payment.status == PaymentStatus.PENDING}">
            <a href="${g.createLink([controller:"payment", action:"confirm", params: [paymentId: payment.id]])}">
               <button type="button" class="button">Confirmar recebimento</button>
            </a>
         </g:if>
      </div>
   </body>
</html>