<g:set var="userId"><sec:username/></g:set>				
<table id="tablePuntos">
				<thead>
					<tr>
					
						<th><g:message code="puntosFechaUsuario.puntos.label" default="Puntos" /></th>
					
						<th><g:message code="puntosFechaUsuario.fecha.label" default="Fecha" /></th>
					
						<th><g:message code="puntosFechaUsuario.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${puntosFechaUsuarioInstanceList}" status="i" var="puntosFechaUsuarioInstance">
					<g:set var="user">${fieldValue(bean: puntosFechaUsuarioInstance, field: "usuario")}</g:set>
					<g:if test="${userId == user}">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" style=" background-color:aqua;">
					
						<td>${fieldValue(bean: puntosFechaUsuarioInstance, field: "puntos")}</td>
					
						<td>${fieldValue(bean: puntosFechaUsuarioInstance, field: "fecha")}</td>
					
						<td>${fieldValue(bean: puntosFechaUsuarioInstance, field: "usuario")}</td>
					
					</tr>
					</g:if>
					<g:else>
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: puntosFechaUsuarioInstance, field: "puntos")}</td>
					
						<td>${fieldValue(bean: puntosFechaUsuarioInstance, field: "fecha")}</td>
					
						<td>${fieldValue(bean: puntosFechaUsuarioInstance, field: "usuario")}</td>
					
					</tr>
					</g:else>

				</g:each>
				</tbody>
			</table>