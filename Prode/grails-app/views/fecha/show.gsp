
<%@ page import="prode.Fecha" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fecha.label', default: 'Fecha')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-fecha" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-fecha" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list fecha">
			
				<g:if test="${fechaInstance?.campeonato}">
				<li class="fieldcontain">
					<span id="campeonato-label" class="property-label"><g:message code="fecha.campeonato.label" default="Campeonato" /></span>
					
						<span class="property-value" aria-labelledby="campeonato-label"><g:link controller="campeonato" action="show" id="${fechaInstance?.campeonato?.id}">${fechaInstance?.campeonato?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${fechaInstance?.horaInicio}">
				<li class="fieldcontain">
					<span id="horaInicio-label" class="property-label"><g:message code="fecha.horaInicio.label" default="Hora Inicio" /></span>
					
						<span class="property-value" aria-labelledby="horaInicio-label"><g:formatDate date="${fechaInstance?.horaInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fechaInstance?.numeroFecha}">
				<li class="fieldcontain">
					<span id="numeroFecha-label" class="property-label"><g:message code="fecha.numeroFecha.label" default="Numero Fecha" /></span>
					
						<span class="property-value" aria-labelledby="numeroFecha-label"><g:fieldValue bean="${fechaInstance}" field="numeroFecha"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fechaInstance?.partidos}">
				<li class="fieldcontain">
					<span id="partidos-label" class="property-label"><g:message code="fecha.partidos.label" default="Partidos" /></span>
					
						<g:each in="${fechaInstance.partidos}" var="p">
						<span class="property-value" aria-labelledby="partidos-label"><g:link controller="partido" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${fechaInstance?.id}" />
					<g:link class="edit" action="edit" id="${fechaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
