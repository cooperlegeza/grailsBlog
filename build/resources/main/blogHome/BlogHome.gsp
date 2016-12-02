<!doctype html>
<html>
	<head>
		<script src="C:\devl\workspaces\GrailsBlogProject\build\resources\bootstrap.min.css"></script>
		<script src="C:\devl\workspaces\GrailsBlogProject\build\resources\bootstrap.min.js"></script>
		<script src="C:\devl\workspaces\GrailsBlogProject\build\resources\jquery-2.1.1.min.js"></script>
		<meta name = "layout" content="blogLayout"/>
		<title>Coolio Blog</title>
	</head>
	<body class="container">
		
            
    	
    	<br>
    	<div>
    		<g:each in="${blogs}">
    			<h3>${it.dateCreated}</h3>
    			<g:link controller='BlogPost' action='show' id='${it.id}'>${it.title}</g:link>
    			<p>${it?.text}</p>
    			<div><h5>Posted by ${it?.author}</h5></div>
    			<sec:ifAnyGranted roles='ROLE_USER,ROLE_ADMIN'>
    		<g:link controller='comment' action='create'>Comment</g:link>
    		  </sec:ifAnyGranted>
    		</g:each>
    		 
    	</div>
	</body>
</html>