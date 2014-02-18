<%@ page import="prode.Campeonato" %>



<div class="fieldcontain ${hasErrors(bean: campeonatoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="campeonato.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="50" required="" value="${campeonatoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campeonatoInstance, field: 'cantidadPartidos', 'error')} ">
	<label for="cantidadPartidos">
		<g:message code="campeonato.cantidadPartidos.label" default="Cantidad Partidos" />
		
	</label>
	<g:field name="cantidadPartidos" type="number" value="${campeonatoInstance.cantidadPartidos}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campeonatoInstance, field: 'fechas', 'error')} ">
	<label for="fechas">
		<g:message code="campeonato.fechas.label" default="Fechas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${campeonatoInstance?.fechas?}" var="f">
    <li><g:link controller="fecha" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="fecha" action="create" params="['campeonato.id': campeonatoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'fecha.label', default: 'Fecha')])}</g:link>
</li>
</ul>

</div>

