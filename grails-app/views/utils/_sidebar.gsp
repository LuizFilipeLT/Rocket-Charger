<div class="sidebar">
    <header>Menu</header>
    <g:link controller="dashboard" action="index">
        <i class="fas fa-chart-bar"></i>
        <span>Dashboard</span>
    </g:link>
    <g:link controller="payment" action="create">
        <i class="fas fa-money-bill-alt"></i>
        <span>Criar Cobrança</span>
    </g:link>
    <g:link controller="payment" action="list">
        <i class="fas fa-list-alt"></i>
        <span>Minhas cobranças</span>
    </g:link>
    <g:link controller="payer" action="create">
        <i class="fas fa-stream"></i>
        <span>Cadastrar cliente</span>
    </g:link>
    <g:link controller="payer" action="list">
        <i class="fas fa-user"></i>
        <span>Meus clientes</span>
    </g:link>
    <g:link controller="customer" action="show">
        <i class="fas fa-id-card"></i>
        <span>Meus dados</span>
    </g:link>
    <g:link controller="logout">
        <i class="fas fa-question-circle"></i>
        <span>Sair</span>
    </g:link>
</div>