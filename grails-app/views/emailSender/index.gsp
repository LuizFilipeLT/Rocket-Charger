<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Email Sender</title>
</head>
<body>
    <div id="content" role="main">
        <section class="row colset-2-its">
            <g:if test="${flash.message}">
                <div class="message" role="alert">
                    ${flash.message}
                </div>
            </g:if>
            <h2>Nova mensagem</h2>
            <g:form controller="emailSender" action="send">
                <div class="fieldcontain">
                  <g:textField name="sendEmail" id="sendEmail" placeholder="rocketchargerjl@gmail.com" required="" />
                </div>
                <div class="fieldcontain">
                  <g:textField name="sendSubject" id="sendSubject" placeholder="destinatário" required="" />
                </div>
                <div class="fieldcontain">
                  <g:textArea name="sendMessage" id="sendMessage" rows="5" cols="80" placeholder="Digite sua mensagem aqui..." required="" />
                </div>
                <fieldset>
                  <g:submitButton name="send" value="Enviar" />
                </fieldset>
            </g:form>
        </section>
    </div>

</body>
</html>