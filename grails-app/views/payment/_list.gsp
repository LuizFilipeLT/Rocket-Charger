<%@ page import="com.rocketcharger.enums.PaymentMethod" %>
<%@ page import="com.rocketcharger.enums.PaymentStatus" %>
<%@ page import="com.rocketcharger.utils.FormatDateUtils" %>
<html lang="pt-br">
   <head>
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
                  <th>Pagador</th>
               </tr>
               <tr>
                  <td>${payment.id}</td>
                  <td>${payment.value}</td>
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
                     <g:link controller="payment" action="show" update="divForm" id="${payment.id}">Ver cobrança</g:link>
                     <g:if test="${payment.status == PaymentStatus.PENDING}">
                        <g:link controller="payment" action="confirm" update="divForm" id="${payment.id}">Confirmar recebimento</g:link>
                     </g:if>
                  </td>
               </tr>
         </g:each>
         </table>
      </g:if>
      <g:else>
         <div><strong>Não há cobranças.</strong></div>
      </g:else>
   </body>
</html>