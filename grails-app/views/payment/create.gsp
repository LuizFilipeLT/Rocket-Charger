<%@ page import="com.rocketcharger.enums.PaymentMethod" %>
<html>
   <head>
      <meta name="layout" content="main"/>
         <title>Criação de Cobrança</title>
      <asset:stylesheet src="index/style.css"/>
      <asset:javascript src="applications/applicationPayment.js" />
   </head>
   <body>
      <div class="container">
         <div class="header">
            <h2>Criação de Cobrança</h2>
         </div>

         <form
            autocomplete="off" class="form"
            data-redirect="${ g.createLink(controller: "payment", action: "list", params: [id: customerId]) }"
            data-url="${ g.createLink(controller: "payment", action: "save") }">

         <div class="form-control">
            <label>Valor do pagamento:</label>
            <input
               type="text"
               name="value"
               id="value"
               placeholder="Valor do pagamento"/>
         </div>

         <div class="form-control">
            <label>Data de Vencimento:</label>
            <input
               type="date"
               name="dueDate"
               id="dueDate"
               placeholder="Data de vencimento"/>
         </div>

         <div class="form-control">
            <label> Método de pagamento:</label>
            <g:select
               id="method"
               name="billingType"
               from="${PaymentMethod?.values()}"
               value="${method}"
               noSelection="['':'Tipo de pagamento']"
               valueMessagePrefix="PaymentMethod"/>
         </div>

         <div class="form-control">
            <label> Selecione o pagador:</label>
            <select id="payerId" name="payerId" required>
               <option>Selecione o pagador</option>
               <g:each var="payer" in="${payerList}">
                  <option value="${payer.id}">${payer.name}</option>
               </g:each>
            </select>
         </div>

         <input
         type="hidden"
         value="${customerId}"
         name="customerId"
         id="customerId"
         />
            <div>
               <button type="submit">Salvar</button>
            </div>
         </form>
      </div>
   </body>
</html>
