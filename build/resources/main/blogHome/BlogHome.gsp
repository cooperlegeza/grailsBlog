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
<<<<<<< HEAD
			<g:each in="${blogs}">
    			<h3>${it.dateCreated}</h3>
    			<g:link controller='BlogPost' action='show' id='${it.id}'>${it.title}</g:link>
    			<p>${it?.text}</p>
    			<div><h5>Posted by ${it?.author}</h5></div>
    			<sec:ifAnyGranted roles='ROLE_USER,ROLE_ADMIN'>
    		<g:link controller='comment' action='create'>Comment</g:link>
    		  </sec:ifAnyGranted>
=======
		
            
    	
    	<br>
    	<div>
    		<g:each in="${blogs}">
				<div class="row">
				<h3><g:link  mapping="searchFriendlyURL"
							 params='[title: "${it.title}", year: "${it.dateCreated.year + 1900}", month: "${it.dateCreated.month + 1}", day: "$it.dateCreated.date"]'
							 id='${it.id}' class="blog-post-title">${it.title}</g:link></h3>
    			<p class="blog-front-page-post">${it?.textForFrontPage()}</p>
    			<div><h5>Posted by ${it?.author} on ${it.dateCreated}</h5></div>
				<hr>
				</div>
>>>>>>> 3b25f0eac15a758636d1cbd063708f4de8f4d1db
    		</g:each>
    		 
    	</div>
	</body>
</html>