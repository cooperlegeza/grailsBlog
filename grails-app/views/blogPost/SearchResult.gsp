<html>
<head>
        <meta name="layout" content="blogLayout" />
</head>
<body class="container">
<div style="height:20px;"></div>
	 <g:each in="${this.postList?.reverse()}" name="defaultList" var="post" status="i">

                <g:link mapping="searchFriendlyURL" params='[title: "${post.title}"]' id="${post.id}">
                  <p><strong class="blogTitle col-xs-12">${post.title}</strong></p>
                </g:link>
                  <p class="col-xs-12">${post.text}</p>
                  <br/>
                  <br/>
                    
                  <p class=" col-xs-2">-${post.author}</p><br/>
                  <p class="col-xs-2">${post.dateCreated}</p><br/>
                  <hr>
                </g:each>

</body>
</html>
