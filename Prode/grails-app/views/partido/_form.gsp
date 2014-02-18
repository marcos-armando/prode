<%@ page import="prode.Partido" %>



<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="partido.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${partidoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'equipoLocal', 'error')} required">
	<label for="equipoLocal">
		<g:message code="partido.equipoLocal.label" default="Equipo Local" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="equipoLocal" name="equipoLocal.id" from="${prode.Equipo.list()}" optionKey="id" required="" value="${partidoInstance?.equipoLocal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'equipoVisitante', 'error')} required">
	<label for="equipoVisitante">
		<g:message code="partido.equipoVisitante.label" default="Equipo Visitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="equipoVisitante" name="equipoVisitante.id" from="${prode.Equipo.list()}" optionKey="id" required="" value="${partidoInstance?.equipoVisitante?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'golesEquipoLocal', 'error')} ">
	<label for="golesEquipoLocal">
		<g:message code="partido.golesEquipoLocal.label" default="Goles Equipo Local" />
		
	</label>
	<g:field name="golesEquipoLocal" type="number" value="${partidoInstance.golesEquipoLocal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'golesEquipoVisitante', 'error')} ">
	<label for="golesEquipoVisitante">
		<g:message code="partido.golesEquipoVisitante.label" default="Goles Equipo Visitante" />
		
	</label>
	<g:field name="golesEquipoVisitante" type="number" value="${partidoInstance.golesEquipoVisitante}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'estadio', 'error')} ">
	<label for="estadio">
		<g:message code="partido.estadio.label" default="Estadio" />
		
	</label>
	<g:select id="estadio" name="estadio.id" from="${prode.Estadio.list()}" optionKey="id" value="${partidoInstance?.estadio?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partidoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="partido.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fecha" name="fecha.id" from="${prode.Fecha.list()}" optionKey="id" required="" value="${partidoInstance?.fecha?.id}" class="many-to-one"/>
</div>

