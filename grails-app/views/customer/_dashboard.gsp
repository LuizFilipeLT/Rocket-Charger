<g:if test="${dashboard}">
  <div>
    <h4>Dashboard cobranças</h4>
    <div>
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
    </div>
    <div>
      <h5>Clientes</h5>
      <div>
        <h4>Total: 
            <g:formatNumber number="${dashboard.totalPayers}" type="number"/>
        </h4>
      </div>
      <div>
        <h4>Adimplentes: 
            <g:formatNumber number="${dashboard.nonDebtDodgers}" type="number"/>
        </h4>
      </div>
      <div>
        <h4>Inadimplentes: 
            <g:formatNumber number="${dashboard.debtDodgers}" type="number"/>
        </h4>
      </div>
    </div>
  </div>
</g:if>
