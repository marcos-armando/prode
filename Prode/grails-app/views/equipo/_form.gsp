<%@ page import="prode.Equipo" %>



<div class="fieldcontain ${hasErrors(bean: equipoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="equipo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="50" required="" value="${equipoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: equipoInstance, field: 'apodo', 'error')} ">
	<label for="apodo">
		<g:message code="equipo.apodo.label" default="Apodo" />
		
	</label>
	<g:textField name="apodo" maxlength="50" value="${equipoInstance?.apodo}"/>
</div>

