<html>
<head>
        <meta name="layout" content="blogLayout" />
</head>
<body class="container">
<div style="height:20px;"></div>
	 <g:each in="${this.postList?.reverse()}" name="defaultList" var="post" status="i">
<<<<<<< HEAD

                <g:link mapping="searchFriendlyURL" params='[title: "${post.title}"] ' id="${post.id}" >
               
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
=======
         <div class="row col-sm-12">
            <p>
                <strong class="blogTitle col-xs-12">
                    <g:link class="search-result-title" mapping="searchFriendlyURL" params='[title: "${post.title}"]' id="${post.id}">
                        ${post.title}
                    </g:link>
                </strong>
            </p>
            <p class="row col-xs-12">${post.text}</p>
             <p class="row col-xs-2"><font color="red">Posted by <u>${post.author}</u> on <span title="${post.dateCreated}"><g:formatDate format="MM/dd"/  date="${post.dateCreated}"/></span></font></p>
            <br>
         </div>
     </g:each>
    </body>
>>>>>>> d698e55adcbeb4bada45f812a8336a168cc29b30
</html>
