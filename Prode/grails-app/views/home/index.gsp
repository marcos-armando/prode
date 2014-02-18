<html>
  <head>
    <meta name="layout" content="main">

    <title>Home</title>
  </head>
  <body>
  		<g:render template="../tmpls_header/menu" />

  <div class="content">
    ${flash.message}
  </div>
  
  
  <div class="content" style='display: none;'>
    <ul>
      <li>
        <a href="<g:createLink controller='Home' action='index' />">Home</a>
      </li>
    </ul>
  </div>
</body>
</html>