
<%@ page import="prode.Campeonato" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'campeonato.label', default: 'Campeonato')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-campeonato" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-campeonato" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list campeonato">
			
				<g:if test="${campeonatoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="campeonato.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${campeonatoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campeonatoInstance?.cantidadPartidos}">
				<li class="fieldcontain">
					<span id="cantidadPartidos-label" class="property-label"><g:message code="campeonato.cantidadPartidos.label" default="Cantidad Partidos" /></span>
					
						<span class="property-value" aria-labelledby="cantidadPartidos-label"><g:fieldValue bean="${campeonatoInstance}" field="cantidadPartidos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campeonatoInstance?.fechas}">
				<li class="fieldcontain">
					<span id="fechas-label" class="property-label"><g:message code="campeonato.fechas.label" default="Fechas" /></span>
					
						<g:each in="${campeonatoInstance.fechas}" var="f">
						<span class="property-value" aria-labelledby="fechas-label"><g:link controller="fecha" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${campeonatoInstance?.id}" />
					<g:link class="edit" action="edit" id="${campeonatoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
