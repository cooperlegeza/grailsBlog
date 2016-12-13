<!doctype html>
<html>
	<head>
		<meta name = "layout" content="blogLayout"/>
		<title>Coolio Blog</title>
		<asset:stylesheet src="application.css"/>
	</head>
	<body class="container">

	
	<div class="imageBackground">

	<br>
		<div id="summary" class="col-sm-3">
			<p>Blogs Archive</p>
			<hr>
			<g:render template="blogByYear" model="[blogs:blogsByDate]"/>
		</div>
		<div class="col-sm-9">
    		<g:render template="blog" collection="${mostRecent}"/>
    	</div>
	</div>
	</body>
</html>