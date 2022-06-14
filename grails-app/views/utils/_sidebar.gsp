<div class="sidebar">
    <header>Menu</header>
    <g:link controller="dashboard" action="index" params="${[customerId: customer.id]}">
        <i class="fas fa-qrcode"></i>
        <span>Dashboard</span>
    </g:link>
    <g:link controller="customer" action="show" params="${[customerId: customer.id]}">
        <i class="fas fa-link"></i>
        <span>Meus dados</span>
    </g:link>
    <g:link controller="payer" action="create" params="${[customerId: customer.id]}">
        <i class="fas fa-stream"></i>
        <span>Cadastrar cliente</span>
    </g:link>
    <g:link controller="payment" action="create" params="${[customerId: customer.id]}">
        <i class="fas fa-calendar"></i>
        <span>Criar Cobrança</span>
    </g:link>
    <g:if test="${payment}">
    <g:link controller="payment" action="list" params="${[customerId: customer.id]}">
        <i class="fas fa-question-circle"></i>
        <span>Minhas cobranças</span>
    </g:link>
    </g:if>
     <g:if test="${payer}">
    <g:link controller="payment" action="list" params="${[customerId: customer.id]}">
        <i class="fas fa-question-circle"></i>
        <span>Meus clientes</span>
    </g:link>
    </g:if>
    <a href="#">
        <i class="fas fa-envelope"></i>
        <span>Contato</span>
    </a>
</div>