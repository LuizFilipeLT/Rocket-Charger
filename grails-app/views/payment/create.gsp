<%@ page import="com.rocketcharger.enums.PaymentMethod" %>
<html>
  <head>
      <script
      src="https://kit.fontawesome.com/c8d140aaae.js"
      crossorigin="anonymous"></script>
    <title>Adicionar pagamento</title>
    <asset:stylesheet src="index/style.css" />
    <asset:javascript src="applications/applicationPayment.js" />
  </head>
  <body>
    <form
      data-redirect="${ g.createLink(controller: "payment", action: "list", params: [id: customerId]) }"
      data-url="${ g.createLink(controller: "payment", action: "save") }">
      <div>
        <label>Valor do pagamento:</label>
        <input
          type="number"
          name="value"
          id="value"
          placeholder="Valor do pagamento"/>
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
      </div>

      <div class="form-control">
        <label>Data de Vencimento:</label>
        <input
          type="date"
          name="dueDate"
          id="dueDate"
          placeholder="Data de vencimento"/>
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
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
          <i class="fas fa-exclamation-circle"></i>
          <i class="fas fa-check-circle"></i>
          <small class="js-msg"></small>
      </div>

      <div class="form-control">
        <label> Selecione o pagador:</label>
        <select id="payerId" name="payerId" required>
          <option>Selecione o pagador</option>
          <g:each var="payer" in="${payerList}">
            <option value="${payer.id}">${payer.name}</option>
          </g:each>
        </select>
        <i class="fas fa-exclamation-circle"></i>
        <i class="fas fa-check-circle"></i>
        <small class="js-msg"></small>
      </div>

      <input
        type="hidden"
        value="${customerId}"
        name="customerId"
        id="customerId"/>

        <button type="submit" id="button">
        <strong>Criar cobrança</strong>
        </button>
    </form>
  </body>
</html>
