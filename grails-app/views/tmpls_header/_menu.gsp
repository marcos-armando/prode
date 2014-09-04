<div class="nav" role="navigation">
  <ul>
    <li>
      <a class="home" href="${createLink(uri: '/')}">Inicio</a>
    </li>
    <g:if test="${session}">
      <sec:ifAllGranted roles="ROLE_ADMIN">	
      	
         	<li>
        	      <a class="" href="${createLink(uri: '/User/Index')}">Usuarios</a>
    		</li>
    		<li>
    		      <a class="" href="${createLink(uri: '/Role/Index')}">Roles</a>
    		</li>
    		<li>
    		      <a class="" href="${createLink(uri: '/UserRole/Index')}">Roles X Usuario</a>
    		</li>
    		<li>
        	      <a class="" href="${createLink(uri: '/Campeonato/Index')}">Campeonatos</a>
    		</li>
    		<li>
        	      <a class="" href="${createLink(uri: '/Equipo/Index')}">Equipos</a>
    		</li>
    		<li>
        	      <a class="" href="${createLink(uri: '/Estadio/Index')}">Estadios</a>
    		</li>
    		<li>
        	      <a class="" href="${createLink(uri: '/Partido/Index')}">Partidos</a>
    		</li>
    		<li>
        	      <a class="" href="${createLink(uri: '/Fecha/Index')}">Fechas</a>
    		</li>
    		<li>
        	      <a class="" href="${createLink(uri: '/PuntosFechaUsuario/Index')}">Puntos</a>
    		</li>
    	</sec:ifAllGranted>
    	<sec:ifAllGranted roles="ROLE_USER">	
    		<li>
        	      <a class="" href="${createLink(uri: '/Apuesta/Index')}">Apuestas</a>
    		</li>
	 		<li>
        	      <a class="" href="${createLink(uri: '/PuntosFechaUsuario/Index')}">Puntos</a>
    		</li>
    	</sec:ifAllGranted>
    	    <li>
    		   	  <a href="<g:createLink controller="logout" />">Logout</a>
    		</li>
    </g:if>
  </ul>
</div>
