
<%@ page import="prode.Partido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'partido.label', default: 'Partido')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-partido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-partido" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list partido">
			
				<g:if test="${partidoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="partido.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${partidoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partidoInstance?.equipoLocal}">
				<li class="fieldcontain">
					<span id="equipoLocal-label" class="property-label"><g:message code="partido.equipoLocal.label" default="Equipo Local" /></span>
					
						<span class="property-value" aria-labelledby="equipoLocal-label"><g:link controller="equipo" action="show" id="${partidoInstance?.equipoLocal?.id}">${partidoInstance?.equipoLocal?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${partidoInstance?.equipoVisitante}">
				<li class="fieldcontain">
					<span id="equipoVisitante-label" class="property-label"><g:message code="partido.equipoVisitante.label" default="Equipo Visitante" /></span>
					
						<span class="property-value" aria-labelledby="equipoVisitante-label"><g:link controller="equipo" action="show" id="${partidoInstance?.equipoVisitante?.id}">${partidoInstance?.equipoVisitante?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${partidoInstance?.golesEquipoLocal}">
				<li class="fieldcontain">
					<span id="golesEquipoLocal-label" class="property-label"><g:message code="partido.golesEquipoLocal.label" default="Goles Equipo Local" /></span>
					
						<span class="property-value" aria-labelledby="golesEquipoLocal-label"><g:fieldValue bean="${partidoInstance}" field="golesEquipoLocal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partidoInstance?.golesEquipoVisitante}">
				<li class="fieldcontain">
					<span id="golesEquipoVisitante-label" class="property-label"><g:message code="partido.golesEquipoVisitante.label" default="Goles Equipo Visitante" /></span>
					
						<span class="property-value" aria-labelledby="golesEquipoVisitante-label"><g:fieldValue bean="${partidoInstance}" field="golesEquipoVisitante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partidoInstance?.estadio}">
				<li class="fieldcontain">
					<span id="estadio-label" class="property-label"><g:message code="partido.estadio.label" default="Estadio" /></span>
					
						<span class="property-value" aria-labelledby="estadio-label"><g:link controller="estadio" action="show" id="${partidoInstance?.estadio?.id}">${partidoInstance?.estadio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${partidoInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="partido.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:link controller="fecha" action="show" id="${partidoInstance?.fecha?.id}">${partidoInstance?.fecha?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
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
