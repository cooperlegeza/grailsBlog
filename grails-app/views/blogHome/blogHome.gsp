log<!doctype html>
<html>
	<head>
		<script src="C:\devl\workspaces\GrailsBlogProject\build\resources\bootstrap.min.css"></script>
		<script src="C:\devl\workspaces\GrailsBlogProject\build\resources\bootstrap.min.js"></script>
		<script src="C:\devl\workspaces\GrailsBlogProject\build\resources\jquery-2.1.1.min.js"></script>
		<meta name = "layout" content="blogLayout"/>
		<title>Coolio Blog</title>
		<asset:stylesheet src="application.css"/>
	</head>
	<body class="container">

	
	<div class="imageBackground">

	<br>
		<div id="summary" class="col-sm-3">
			<p>Most Recent Blog Posts</p>
			<hr>
			<g:each in="${blogs}">
				<ul>
					<li>
						<g:link mapping="searchFriendlyURL"
								 params='[title: "${it.title}", year: "${it.dateCreated.year + 1900}", month: "${it.dateCreated.month + 1}", day: "$it.dateCreated.date"]'
								 id='${it.id}' class="most-recent-blog">${it.title}</g:link> by ${it.author} on <span class="most-recent-date-created" title="${it.dateCreated}"><g:formatDate format="MM/dd"/  date="${it.dateCreated}"/></span>
					</li>
				</ul>
			</g:each>
		</div>
		<div class="col-sm-9">
			<h1 class="row"><u><b>Most Recent</b></u></h1>
			<br/>
    		<g:render template="blog" collection="${mostRecent}"/>
    		 
    	</div>
	</body>
</html>