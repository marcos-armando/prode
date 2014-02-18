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
			
			<div id="create-partido" class="content scaffold-create">			
			<g:message code="Fecha: " default="Fecha: " />
  			  <g:select optionKey="id" name="Fechas" from="${fechas}" disabled="true"/>
  			  </div>
  			  
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
					
						<td><input type="radio" name="radioGroup${(i)}" value="Local" class="radiob" id="${(partidoInstance.id)}"></td>
					
						<td>${fieldValue(bean: partidoInstance, field: "equipoLocal")}</td>
						
						<td><input type="radio" name="radioGroup${(i)}" value="Empate" class="radiob" id="${(partidoInstance.id)}""></td>
					
						<td>${fieldValue(bean: partidoInstance, field: "equipoVisitante")}</td>
						
						<td><input type="radio" name="radioGroup${(i)}" value="Visitante" class="radiob" id="${(partidoInstance.id)}""></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${partidoInstanceTotal}" />
			</div>
			
			
				<fieldset class="buttons">
					<!-- <g:submitButton name="create" class="save" value="Guardar"/> !-->
					<g:if test="${partidoInstanceList}">
						<g:actionSubmit value="GUARDAR" onclick="save()" />
					</g:if>
						<g:actionSubmit value="VOLVER" onclick="volver()" />
				</fieldset>		
			
		</div>
</body>
</html>

<g:javascript>    
var listResult = new Array();
var i = 0;

function save(){
   
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
        	return false
        }
    
    $.ajax({
  	url: "${createLink(controller: 'Apuesta', action: 'getJson')}",
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

