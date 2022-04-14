<html>
<head>
    <title>Adicionar um cliente</title>
    <asset:javascript src="application.js"/>
</head>
<body>
    <form action="${ g.createLink(controller: 'payer', action: 'save') }"> 
        <input type="text" name="name" placeholder="name"><br>
        <input type="text" name="email" placeholder="email"><br>
        <input type="date" name="nascimento" placeholder="nascimento"><br>
        <input type="text" name="cep" placeholder="cep"><br>
        <input type="text" name="endereco" placeholder="endereco"><br>
        <input type="text" name="cidade" placeholder="cidade"><br>
        <input type="text" name="estado" placeholder="UF"><br>
        <input type="submit" name="btnSalvar" value="salvar"/><br>
        <input type="button" name="btnCancelar" value="Cancelar"/>
    </form>

    <script>
        $(document).ready(function() {
            $("form").on("submit", function(e) {
                e.preventDefault();
                
                var data = new FormData(document.querySelector("form"));
                var customer = {};

                data.forEach(function(value, key) {
                    customer[key] = value;
                });

                $.post("/payer/save", customer, function(response) {
                    console.log(response);
                    if (response.success) {
                        window.location.href = "/payer/"
                    } else {
                        alert("Houve um erro")
                    }
                })
            });
        })
    </script>
</body>
</html>
