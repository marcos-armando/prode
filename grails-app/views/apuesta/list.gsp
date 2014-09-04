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
				<!-- <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li> --> 
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
					
						<th><g:message code="fecha.numeroFecha.label" default="Fecha N°" /></th>
					
						<th><g:message code="fecha.horaInicio.label" default="Dia de Inicio" /></th>
						
						<th><g:message default="Opciones" code="Opciones" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fechaInstanceList}" status="i" var="fechaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					<td>${fieldValue(bean: fechaInstance, field: "numeroFecha")}</td>
									
						<td>${fieldValue(bean: fechaInstance, field: "horaInicio")}</td>
						
						<td>
						<g:link action="create" id="${fechaInstance.numeroFecha}">CREAR/EDITAR</g:link>
						 
						<!-- <g:link action="edit" id="${fechaInstance.numeroFecha}">Editar</g:link>  -->
						</td>
					
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