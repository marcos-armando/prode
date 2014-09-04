<%@ page import="prode.PuntosFechaUsuario" %>



<div class="fieldcontain ${hasErrors(bean: puntosFechaUsuarioInstance, field: 'puntos', 'error')} required">
	<label for="puntos">
		<g:message code="puntosFechaUsuario.puntos.label" default="Puntos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="puntos" type="number" value="${puntosFechaUsuarioInstance.puntos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: puntosFechaUsuarioInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="puntosFechaUsuario.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fecha" name="fecha.id" from="${prode.Fecha.list()}" optionKey="id" required="" value="${puntosFechaUsuarioInstance?.fecha?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: puntosFechaUsuarioInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="puntosFechaUsuario.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${prode.User.list()}" optionKey="id" required="" value="${puntosFechaUsuarioInstance?.usuario?.id}" class="many-to-one"/>
</div>

