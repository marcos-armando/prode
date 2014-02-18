<%@ page import="prode.Fecha" %>



<div class="fieldcontain ${hasErrors(bean: fechaInstance, field: 'campeonato', 'error')} required">
	<label for="campeonato">
		<g:message code="fecha.campeonato.label" default="Campeonato" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="campeonato" name="campeonato.id" from="${prode.Campeonato.list()}" optionKey="id" required="" value="${fechaInstance?.campeonato?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fechaInstance, field: 'horaInicio', 'error')} required">
	<label for="horaInicio">
		<g:message code="fecha.horaInicio.label" default="Hora Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="horaInicio" precision="day"  value="${fechaInstance?.horaInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: fechaInstance, field: 'numeroFecha', 'error')} required">
	<label for="numeroFecha">
		<g:message code="fecha.numeroFecha.label" default="Numero Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numeroFecha" type="number" value="${fechaInstance.numeroFecha}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: fechaInstance, field: 'partidos', 'error')} ">
	<label for="partidos">
		<g:message code="fecha.partidos.label" default="Partidos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${fechaInstance?.partidos?}" var="p">
    <li><g:link controller="partido" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="partido" action="create" params="['fecha.id': fechaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'partido.label', default: 'Partido')])}</g:link>
</li>
</ul>

</div>

