
<%@ page import="prode.PuntosFechaUsuario" %>
<!DOCTYPE html>
<html>
	<head>
		<g:javascript library='jquery' />
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'puntosFechaUsuario.label', default: 'PuntosFechaUsuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-puntosFechaUsuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-puntosFechaUsuario" class="content scaffold-list" role="main">

			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div id="puntos-fechas" class="content scaffold-create">			
			<g:message code="Campeonato: " default="Campeonato: " />
  		 	<g:select id="campeonato" name="campeonato" onchange="updateFecha( this.value )" from="${campeonatos}"/>
  		 	<g:message code="Fecha: " default="Fecha: " />
			<select id="fecha" name="fecha" onchange="updateTabla( this )"/></select>
				<sec:ifNotGranted roles="ROLE_USER">
					<g:if test="${!contactInstance}">
						<g:actionSubmit value="Calcular Puntos" onclick="calcularPuntos()" id="calcPuntos"/>
					</g:if>
				</sec:ifNotGranted>
  			</div>
  			<g:render template="puntosUsuarios" model="['contactInstance':puntos]"/>
			<!--  <table id="tablePuntos">
				<thead>
					<tr>
					
						<th><g:message code="puntosFechaUsuario.puntos.label" default="Puntos" /></th>
					
						<th><g:message code="puntosFechaUsuario.fecha.label" default="Fecha" /></th>
					
						<th><g:message code="puntosFechaUsuario.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${puntosFechaUsuarioInstanceList}" status="i" var="puntosFechaUsuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: puntosFechaUsuarioInstance, field: "puntos")}</td>
					
						<td>${fieldValue(bean: puntosFechaUsuarioInstance, field: "fecha")}</td>
					
						<td>${fieldValue(bean: puntosFechaUsuarioInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>-->
			<div class="pagination">
				<g:paginate total="${puntosFechaUsuarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

<g:javascript>

$(document).ready(function() {
	var camp = $('#campeonato').val();
  	updateFecha(camp)
});

function updateFecha( campeonato ){ 
  
   $.ajax({
  	url: "${createLink(controller: 'puntosFechaUsuario', action: 'getFechas')}",
  	data: {
  		campeonatos: campeonato
  		},
    success: function(data) {
		var fecha = $('#fecha');
		fecha.empty();
		for (var i = 0; i < data.length; i++) {
	  		//alert(data[i].numeroFecha);
			 var opt = document.createElement("option");
    		      document.getElementById("fecha").options.add(opt);
    		      opt.text = data[i].numeroFecha;
        		  opt.value = data[i].id;
        		  opt.id = data[i].id
		}
		
    },
    error: function(request, status, error) {
        alert(error)
    },
    complete: function() {
     	//var opt = document.createElement("option");
    	var fecha = document.getElementById("fecha");
    	//var option = fecha.options[fecha.selectedIndex];
    	updateTabla(fecha);
    }
    });
} 

function updateTabla( fecha ){   
     	//alert(fecha.options[fecha.selectedIndex].value);
     	if(fecha.selectedIndex == -1){
     		var fechas = fecha.selectedIndex
     	}
     	else
     	{
     		var fechas = fecha.options[fecha.selectedIndex].value
     	}
   $.ajax({
  	url: "${createLink(controller: 'puntosFechaUsuario', action: 'getPuntos')}",
  	data: { 
  		fechas: fechas,
  		campeonatos: $('#campeonato').val()
  		},
    success: function(data) {
		$('#tablePuntos').html(data);
		var tabla = document.getElementById("tablePuntos").rows.length;
		if (tabla > 1) {
			document.getElementById('calcPuntos').style.display = 'none';
			}
			else{
			document.getElementById('calcPuntos').style.display = '';
			}
    },
    error: function(request, status, error) {
        alert(error)
    },
    complete: function() {
    }
    });
} 

function calcularPuntos( ){   
     	if(fecha.selectedIndex == -1){
     		var fechas = fecha.selectedIndex
     	}
     	else
     	{
     		var fechas = fecha.options[fecha.selectedIndex].value
     	}
   $.ajax({
  	url: "${createLink(controller: 'puntosFechaUsuario', action: 'calcularPuntos')}",
  	data: { 
  		fechas: fechas,
  		campeonatos: $('#campeonato').val()
  		},
    success: function(data) {
    	alert(data)
		updateTabla($('#fecha')[0])
    },
    error: function(request, status, error) {
        alert(error)
    },
    complete: function() {
    }
    });
} 
</g:javascript>