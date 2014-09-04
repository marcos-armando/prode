<%@ page import="prode.Apuesta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resultadoApuesta.label', default: 'Apuestas')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
<body>
		<a href="#list-partido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
    <div id="list-partido" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
  			  
			<table>
				<thead>
					<tr>
					
						<th><g:message code="Local" default="Local" /></th>
					
						<th><g:message code="partido.equipoLocal.label" default="Equipo Local" /></th>
						
						<th><g:message code="Empate" default="Empate" /></th>
					
						<th><g:message code="partido.equipoVisitante.label" default="Equipo Visitante" /></th>
						
						<th><g:message code="Visitante" default="Visitante" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${partidoInstance}" status="i" var="partidoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><input type="radio" name="radioGroup${(i)}" value="Local" ></td>
					
						<td>${fieldValue(bean: partidoInstance, field: "equipoLocal")}</td>
						
						<td><input type="radio" name="radioGroup${(i)}" value="Empate"></td>
					
						<td>${fieldValue(bean: partidoInstance, field: "equipoVisitante")}</td>
						
						<td><input type="radio" name="radioGroup${(i)}" value="Visitante"></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>

							<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${partidoInstance?.id}" />
					<g:link class="edit" action="edit" id="${partidoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		
</body>


</html>