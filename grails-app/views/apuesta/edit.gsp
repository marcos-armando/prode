<%@ page import="prode.Apuesta" %>
<!DOCTYPE html>
<html>
	<head>
	<g:javascript library='jquery' />
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fecha.label', default: 'Fecha')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
<body>
		<a href="#list-partido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		
    <div id="list-partido" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
  			  
			<table id="tablaPartidos">
				<thead>
					<tr>
						<th style="display:none;"><g:message code="partido.id" default="Id" /></th>
						
						<th><g:message code="Local" default="Local" /></th>
					
						<th><g:message code="partido.equipoLocal.label" default="Equipo Local" /></th>
						
						<th><g:message code="Empate" default="Empate" /></th>
					
						<th><g:message code="partido.equipoVisitante.label" default="Equipo Visitante" /></th>
						
						<th><g:message code="Visitante" default="Visitante" /></th>
					
					</tr>
				</thead>
				<tbody>
				
					<g:each in="${partidoInstanceList}" status="i" var="partidoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td style="display:none;">${fieldValue(bean: partidoInstance, field: "id")}</td>
						
						<g:if test="${apuestasList[i].resultadoApostado == 'Local'}">
						<td><input type="radio" name="radioGroup${(i)}" value="Local" class="radiob" id="${(partidoInstance.id)}" checked="checked"></td>
						</g:if>
						<g:if test="${apuestasList[i].resultadoApostado != 'Local'}">
						<td><input type="radio" name="radioGroup${(i)}" value="Local" class="radiob" id="${(partidoInstance.id)}"></td>
						</g:if>
						
						<td>${fieldValue(bean: partidoInstance, field: "equipoLocal")}</td>
						
						<g:if test="${apuestasList[i].resultadoApostado == 'Empate'}">
						<td><input type="radio" name="radioGroup${(i)}" value="Empate" class="radiob" id="${(partidoInstance.id)}" checked="checked"></td>
						</g:if>
						<g:if test="${apuestasList[i].resultadoApostado != 'Empate'}">
						<td><input type="radio" name="radioGroup${(i)}" value="Empate" class="radiob" id="${(partidoInstance.id)}"></td>
						</g:if>
					
						<td>${fieldValue(bean: partidoInstance, field: "equipoVisitante")}</td>
						
						<g:if test="${apuestasList[i].resultadoApostado == 'Visitante'}">
						<td><input type="radio" name="radioGroup${(i)}" value="Visitante" class="radiob" id="${(partidoInstance.id)}" checked="checked"></td>
						</g:if>
						<g:if test="${apuestasList[i].resultadoApostado != 'Visitante'}">
						<td><input type="radio" name="radioGroup${(i)}" value="Visitante" class="radiob" id="${(partidoInstance.id)}"></td>
						</g:if>
					
					</tr>
				</g:each>

				
				</tbody>
			</table>
						
				<fieldset class="buttons">
					<g:if test="${apuestasList[1]}">
						<g:actionSubmit value="GUARDAR" onclick="actualizar()"/>
					</g:if>
						<g:actionSubmit value="VOLVER" onclick="volver()" />
				</fieldset>		
			
		</div>
</body>
</html>

<g:javascript>    
var listResult = new Array();
var i = 0;

function actualizar(){
   
	$(".radiob").each(function() {
	
        if($(this).is(':checked')){
        var partido = $(this).attr("id");
        var result = $(this).val();
        listResult[i] = partido + "/" + result;
        i++;
        }
        
    });
    
    	if(i != 8){
        	alert("Faltan resultados de marcar")
        	var i = 0;
        	listResult = new Array();
        	return false
        }
    
    $.ajax({
  	url: "${createLink(controller: 'Apuesta', action: 'actualizar')}",
  	data: {
  		resultados: listResult.join("-")
  		},
    success: function(data) {
        alert(data)
    },
    error: function(request, status, error) {
        alert(error)
    },
    complete: function() {
    	$(location).attr('href','http://localhost:8080/Prode/apuesta/list')
    }
    });

}

function volver(){
	$(location).attr('href','http://localhost:8080/Prode/apuesta/list')
}
</g:javascript>