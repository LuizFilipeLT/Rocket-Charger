<%
    String title = message(code: 'header.title.' + controllerName + '.' + actionName, default: '')
%>
<g:if test="${title}">
    <content tag="title">${title}</content>
    <div class="page-header">
        ${title}
    </div>
</g:if>