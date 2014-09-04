<%@ page import="prode.Estadio" %>



<div class="fieldcontain ${hasErrors(bean: estadioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="estadio.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="50" required="" value="${estadioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadioInstance, field: 'equipo', 'error')} ">
	<label for="equipo">
		<g:message code="estadio.equipo.label" default="Equipo" />
		
	</label>
	<g:select id="equipo" name="equipo.id" from="${prode.Equipo.list()}" optionKey="id" value="${estadioInstance?.equipo?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

