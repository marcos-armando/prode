
<%@ page import="prode.Partido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'partido.label', default: 'Partido')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-partido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
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
					
						<g:sortableColumn property="nombre" title="${message(code: 'partido.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="partido.equipoLocal.label" default="Equipo Local" /></th>
					
						<th><g:message code="partido.equipoVisitante.label" default="Equipo Visitante" /></th>
					
						<g:sortableColumn property="golesEquipoLocal" title="${message(code: 'partido.golesEquipoLocal.label', default: 'Goles Equipo Local')}" />
					
						<g:sortableColumn property="golesEquipoVisitante" title="${message(code: 'partido.golesEquipoVisitante.label', default: 'Goles Equipo Visitante')}" />
					
						<th><g:message code="partido.estadio.label" default="Estadio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${partidoInstanceList}" status="i" var="partidoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${partidoInstance.id}">${fieldValue(bean: partidoInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: partidoInstance, field: "equipoLocal")}</td>
					
						<td>${fieldValue(bean: partidoInstance, field: "equipoVisitante")}</td>
					
						<td>${fieldValue(bean: partidoInstance, field: "golesEquipoLocal")}</td>
					
						<td>${fieldValue(bean: partidoInstance, field: "golesEquipoVisitante")}</td>
					
						<td>${fieldValue(bean: partidoInstance, field: "estadio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${partidoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
