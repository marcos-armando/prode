
<%@ page import="prode.Fecha" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fecha.label', default: 'Fecha')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-fecha" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-fecha" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="fecha.campeonato.label" default="Campeonato" /></th>
					
						<g:sortableColumn property="horaInicio" title="${message(code: 'fecha.horaInicio.label', default: 'Hora Inicio')}" />
					
						<g:sortableColumn property="numeroFecha" title="${message(code: 'fecha.numeroFecha.label', default: 'Numero Fecha')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fechaInstanceList}" status="i" var="fechaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fechaInstance.id}">${fieldValue(bean: fechaInstance, field: "campeonato")}</g:link></td>
					
						<td><g:formatDate date="${fechaInstance.horaInicio}" /></td>
					
						<td>${fieldValue(bean: fechaInstance, field: "numeroFecha")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fechaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
