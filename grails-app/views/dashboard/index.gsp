<html>
  <head>
    <meta name="layout" content="main"/>
      <title>Dashboard Cobranças</title>
    <asset:stylesheet src="dashboard.css" />
  </head>
  <body>
    <utilsTagLib:header />
<div class="values-container">
  <section class="box">
    <h5 class="box-header">Clientes</h5>
    <div class="display-value-small">
      <h4 class="box-content">Total: 
          <g:formatNumber number="${dashboard.totalPayers}" type="number"/>
      </h4>
    </div>
    <div class="display-value-small">
      <h4 class="box-content">Em dia: 
          <g:formatNumber number="${dashboard.nonDebtDodgers}" type="number"/>
      </h4>
    </div>
    <div class="display-value-small">
      <h4 class="box-content">Inadimplentes: 
          <g:formatNumber number="${dashboard.debtDodgers}" type="number"/>
      </h4>
    </div>
  </section>
  <section class="box">
    <h5 class="box-header">Valores</h5>
    <div class="display-value-small">
      <h4 class="box-content">Previstas:
        <span class="yellow-text">
          <g:formatNumber number="${dashboard.toReceive}" type="currency" currencyCode="BRL"/>
        </span>
      </h4>
    </div>
    <div class="display-value-small">
      <h4 class="box-content">Recebidas:
        <span class="green-text">
          <g:formatNumber number="${dashboard.receivedValue}" type="currency" currencyCode="BRL"/>
        </span>
      </h4>
    </div>
    <div class="display-value-small">
      <h4 class="box-content">Vencidas:
        <span class="red-text">
          <g:formatNumber number="${dashboard.overdue}" type="currency" currencyCode="BRL"/>
        </span>
      </h4>
    </div>
  </section>
</div>
  </body>
</html>

