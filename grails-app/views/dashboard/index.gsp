<html>
  <head>
    <meta name="layout" content="main"/>
      <title>Dashboard Cobranças</title>
    <asset:stylesheet src="index/style.css" />
    <asset:stylesheet src="customer/show.css" />
    <asset:javascript src="applications/applicationForm.js" />
  </head>
  <body>
  <h4>Dashboard cobranças</h4>
<div>
  <section>
    <h5>Valores</h5>
    <div>
      <h4>Recebidos:
          <g:formatNumber number="${dashboard.receivedValue}" type="currency" currencyCode="BRL"/>
      </h4>
    </div>
    <div>
      <h4>À Receber:
          <g:formatNumber number="${dashboard.toReceive}" type="currency" currencyCode="BRL"/>
      </h4>
    </div>
    <div>
      <h4>Vencidos: 
          <g:formatNumber number="${dashboard.overdue}" type="currency" currencyCode="BRL"/>
      </h4>
    </div>
  </section>
  <section>
    <h5>Clientes</h5>
    <div>
      <h4>Total: 
          <g:formatNumber number="${dashboard.totalPayers}" type="number"/>
      </h4>
    </div>
    <div>
      <h4>Adimplentes: 
          <g:formatNumber number="${dashboard.nonDefaulters}" type="number"/>
      </h4>
    </div>
    <div>
      <h4>Inadimplentes: 
          <g:formatNumber number="${dashboard.defaulters}" type="number"/>
      </h4>
    </div>
  </section>
</div>
  </body>
</html>

