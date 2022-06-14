<%@ page import="com.rocketcharger.enums.PaymentMethod" %>
<%@ page import="com.rocketcharger.enums.PaymentStatus" %>
<%@ page import="com.rocketcharger.utils.FormatDateUtils" %>
    <head>
        <meta name="layout" content="main"/>
        <utilsTagLib:header />
    </head>
  <body>
      <g:if test="${paymentList}">
         <g:each var="payment" in="${paymentList}">
            <table>
               <tr>
                  <th>ID</th>
                  <th>Valor do pagamento</th>
                  <th>Tipo de Pagamento</th>
                  <th>Status</th>
                  <g:if test="${payment.status == PaymentStatus.PAID}">
                     <th>Data de Pagamento</th>
                  </g:if>
                  <th>Data de Vencimento</th>
                  <th>Cliente</th>
               </tr>
               <tr>
                  <td>${payment.id}</td>
                  <td><g:formatNumber number="${payment.value}" type="currency" currencyCode="BRL"/></td>
                  <td>
                     <g:message code="PaymentMethod.${payment.billingType}"/>
                  </td>
                  <td>
                     <g:message code="PaymentStatus.${payment.status}"/>
                  </td>
                  <g:if test="${payment.status == PaymentStatus.PAID}">
                     <td>
                        <g:formatDate format="dd/MM/yyyy" type="dateTime" style="SHORT" date="${payment.paymentDate}"/>
                     </td>
                  </g:if>
                  <td>
                     <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/>
                  </td>
                  <td>${payment.payer.name}</td>
                  <td>
                  <td>
                    <a href="${g.createLink([controller:"payment", show:"confirm", params: [paymentId: payment.id]])}">
                        <button type="button">Ver cobrança</button>
                    </a>
                   </td>
                     <g:if test="${payment.status == PaymentStatus.PENDING}">
                     <td>
                        <a href="${g.createLink([controller:"payment", action:"confirm", params: [paymentId: payment.id]])}">
                            <button type="button">Confirmar recebimento</button>
                        </a>
                      </td>
                     </g:if>
                  </td>
               </tr>
         </g:each>
         </table>
        <div>
      <g:paginate total="${totalCount}" controller="payer" action="list" params="${params}" next="Próxima" prev="Anterior" max="9"/>
    </div>
      </g:if>
      <g:else>
         <div><strong>Não há cobranças.</strong></div>
      </g:else>
   </body>