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
    			<h2>${it.title}</h2>
    			<p>${it?.text}</p>
    			<div><h5>Posted by ${it?.author}</h5></div>
    		</g:each>
    	</div>
	</body>
</html>