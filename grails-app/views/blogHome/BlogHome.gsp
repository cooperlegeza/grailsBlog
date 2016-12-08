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
			<g:each in="${mostRecent}">
				<ul>
					<li>
						<g:link  mapping="searchFriendlyURL"
								 params='[title: "${it.title}", year: "${it.dateCreated.year + 1900}", month: "${it.dateCreated.month + 1}", day: "$it.dateCreated.date"]'
								 id='${it.id}' class="most-recent-blog">${it.title}</g:link> by ${it.author} on <span class="most-recent-date-created" title="${it.dateCreated}"><g:formatDate format="MM/dd"/  date="${it.dateCreated}"/></span>
					</li>
				</ul>
			</g:each>
		</div>
		<div class="col-sm-9">

    		<g:each in="${blogs}">
				<div class="blogs row">

					<h3><g:link  mapping="searchFriendlyURL"
							 params='[title: "${it.title}", year: "${it.dateCreated.year + 1900}", month: "${it.dateCreated.month + 1}", day: "$it.dateCreated.date"]'

							 id='${it.id}'>${it.title}</g:link></h3>
    			<p class="blog-front-page-post">${it?.textForFrontPage()}</p>
    			<div><h5>Posted by ${it?.author} on ${it.dateCreated}</h5></div>
				

							 id='${it.id}' class="blog-post-title">${it.title}</g:link></h3>
    				<p><span class="blog-front-page-post">${it?.text}</span></p>
					<br>
					<div>
						<h5>
							Posted by <span class="blog-front-page-author">${it?.author}</span> on <span class="date-created">${it.dateCreated}</span>
						</h5>
					</div>
					<hr>

				</div>
				<br>
    		</g:each>
    		 
    	</div>
	</body>
</html>