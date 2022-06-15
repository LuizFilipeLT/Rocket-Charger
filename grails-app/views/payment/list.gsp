<%@ page import="com.rocketcharger.enums.PaymentMethod" %>
<%@ page import="com.rocketcharger.enums.PaymentStatus" %>
<%@ page import="com.rocketcharger.utils.FormatDateUtils" %>
    <head>
        <asset:stylesheet src="list.css" />
        <meta name="layout" content="main"/>
    </head>
   <body>
   <utilsTagLib:header />
   <div class="container-body">
      <g:if test="${paymentList}">
         <g:each var="payment" in="${paymentList}">
            <table>
               <tr>
                  <th>Valor do pagamento</th>
                  <th>Tipo de Pagamento</th>
                  <th>Status</th>
                  <th>Data de Vencimento</th>
                  <th>Cliente</th>
                  <th>Opções</th>
               </tr>
               <tr>
                  <td><g:formatNumber number="${payment.value}" type="currency" currencyCode="BRL"/></td>
                  <td>
                     <g:message code="PaymentMethod.${payment.billingType}"/>
                  </td>
                  <td>
                     <g:message code="PaymentStatus.${payment.status}"/>
                  </td>
                  <td>
                     <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/>
                  </td>
                  <td>${payment.payer.name}</td>
                  <td>
                    <a href="${g.createLink([controller:"payment", action:"show", params: [paymentId: payment.id]])}">
                        <button type="button" class="button">Ver cobrança</button>
                    </a>
                     <g:if test="${payment.status == PaymentStatus.PENDING}">
                     <a href="${g.createLink([controller:"payment", action:"confirm", params: [paymentId: payment.id]])}">
                        <button type="button" class="button">Confirmar recebimento</button>
                     </a>
                     </g:if>
                  </td>
               </tr>
         </g:each>
         </table>
        <div>
      <g:paginate total="${totalCount}" controller="payment" action="list" params="${params}" next="Próxima" prev="Anterior" max="9"/>
    </div>
      </g:if>
      <g:else>
         <div><strong>Não há cobranças.</strong></div>
      </g:else>
   </body>