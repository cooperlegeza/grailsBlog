<html>
<head>
    <meta name = "layout" content="blogLayout"/>
    <title>Search Results</title>
</head>
<h1>Search Results</h1>
<body class="container">
<div class="col-md-12">
<g:form>
<h1>${blogPostSearchResults}</h1>
<g:each in="${blogPostSearchResults}" var="post" status="i">

<h4> ${i+1}. ${post.title},${post.content} </h4>
</g:each>
</g:form>
</div>
</body>
</html>
