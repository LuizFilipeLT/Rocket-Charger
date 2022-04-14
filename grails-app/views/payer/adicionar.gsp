<html>
<head>
    <title>Document</title>
    <asset:javascript src="application.js"/>
</head>
<body>
    <form action="${ g.createLink(controller: 'payer', action: 'save') }"> 
        <input type="text" name="name" placeholder="nome"><br>
        <input type="text" name="email" placeholder="email"><br>
        <input type="date" name="birthday" placeholder="nascimento"><br>
        <input type="text" name="postalCode" placeholder="cep"><br>
        <input type="text" name="address" placeholder="endereco"><br>
        <input type="text" name="city" placeholder="cidade"><br>
        <input type="text" name="state" placeholder="UF"><br>
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
