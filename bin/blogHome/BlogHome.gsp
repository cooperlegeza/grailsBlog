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
		<div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
	            <li><g:link class="create" controller="BlogPost" action="create">New post</g:link></li>
	            <li><g:link class="list" controller="BlogPost" action="index">Index</g:link></li>
	            <li><g:link controller="User" action="login">Login</g:link></li>
            </ul>
    	</div>
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