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

				<h3><g:link mapping="searchFriendlyURL"
							params="[title: '${post.title]', year: '${post.createdDate.year}', month: '${post.createdDate.month}', day: '${post.createdDate.day}']"
							id='${it.id}'>
					${it.title}
				</g:link></h3>
    			<p class="blog-front-page-post">${it?.text}</p>
    			<div><h5>Posted by ${it?.author} on ${it.dateCreated}</h5></div>
				<hr>
    		</g:each>
    		 
    	</div>
	</body>
</html>