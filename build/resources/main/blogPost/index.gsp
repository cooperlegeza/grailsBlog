<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="blogLayout" />
        <g:set var="entityName" value="${message(code: 'blogPost.label', default: 'BlogPost')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body class="container">
    
        <a href="#list-blogPost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="list-blogPost" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${blogPostList}" />

            <div class="pagination">
                <g:paginate total="${blogPostCount ?: 0}" />
            </div>
        </div>
        
                        </li>
        <g:each in="${this.postList?.reverse()}" name="defaultList" var="post" status="i">

                <g:link mapping="searchFriendlyURL" params='[title: "${post.title}"]' id="${post.id}">
                  <p><strong class="blogTitle col-xs-12">${post.title}</strong></p>
                </g:link>
                  <p class="col-xs-10">${post.body}</p>
                  <br/>
                  <p class="col-xs-offset-10 col-xs-2">-${post.author}</p>
                  <p class="col-xs-offset-10 col-xs-2">${post.dateCreated}</p>
                  <hr>
                </g:each>
        
    </body>
</html>