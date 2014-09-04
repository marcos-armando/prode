
<%@ page import="prode.PuntosFechaUsuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'puntosFechaUsuario.label', default: 'PuntosFechaUsuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-puntosFechaUsuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-puntosFechaUsuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list puntosFechaUsuario">
			
				<g:if test="${puntosFechaUsuarioInstance?.puntos}">
				<li class="fieldcontain">
					<span id="puntos-label" class="property-label"><g:message code="puntosFechaUsuario.puntos.label" default="Puntos" /></span>
					
						<span class="property-value" aria-labelledby="puntos-label"><g:fieldValue bean="${puntosFechaUsuarioInstance}" field="puntos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${puntosFechaUsuarioInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="puntosFechaUsuario.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:link controller="fecha" action="show" id="${puntosFechaUsuarioInstance?.fecha?.id}">${puntosFechaUsuarioInstance?.fecha?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${puntosFechaUsuarioInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="puntosFechaUsuario.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="user" action="show" id="${puntosFechaUsuarioInstance?.usuario?.id}">${puntosFechaUsuarioInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${puntosFechaUsuarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${puntosFechaUsuarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
