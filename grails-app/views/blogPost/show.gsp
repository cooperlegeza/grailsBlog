<!DOCTYPE html>
<%--suppress ALL --%>
<html>
    <head>
        <meta name="layout" content="blogLayout" />
        <script src="C:\devl\workspaces\GrailsBlogProject\build\resources\bootstrap.min.css"></script>
		<script src="C:\devl\workspaces\GrailsBlogProject\build\resources\bootstrap.min.js"></script>
		<script src="C:\devl\workspaces\GrailsBlogProject\build\resources\jquery-2.1.1.min.js"></script>
        <g:set var="entityName" value="${message(code: 'blogPost.label', default: 'BlogPost')}" />
        <g:javascript src="commentScript.js" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
        <body class="container">
        <a href="#show-blogPost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        
        <div id="show-blogPost" class="content scaffold-show row" role="main">
            <div class="row col-sm-12">
                <font color="gray"><g:formatDate date="${this.blogPost.dateCreated}" format="EEEE, MMMM dd, yyyy"/></font>

                <h1><span id="title">${this.blogPost.title}</span></h1>
                <g:if test="${flash.message}">
                <div class="alert alert-danger alert-dismissable" role="status">${flash.message}</div>
                </g:if>
            </div>
            <div>
                <div class="row col-sm-12" id="text">${this.blogPost.text}</div>
                <div class="row col-sm-12">
                    <hr>
                    <br>

                    <h4>
                        <span>Posted by <span id="author">${this.blogPost.author}</span> on <span id="date-created" title="${this.blogPost.dateCreated}"><g:formatDate format="MM/dd"/  date="${this.blogPost.dateCreated}"/></span></span>
                    </h4>

                </div>
                <sec:ifAnyGranted roles='ROLE_ADMIN'>
                    <g:link class="edit" action="edit" resource ="${this.blogPost}">
                        <button class="btn btn-primary">
                            Edit Post
                        </button>
                    </g:link>
                    <g:form action="delete" method="DELETE" class="btn-group" role="group">
                        <g:link action="delete" class="delete" type="submit">
                            <g:hiddenField name="id" value="${this.blogPost.id}"/>
                            <button class="btn btn-warning" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                Delete
                            </button>
                        </g:link>
                    </g:form>
                </sec:ifAnyGranted>
            </div>
            <br>
        </div>
        <div>
            <br>
            <div class="col-sm-12">
                <div class="row"><h2>Comments:</h2></div>
                <hr class="comment-hr">
                <div id="commentUpdates">
                    <g:render template='/blogPost/commentsTemplate' collection="${this.blogPost.comments.reverse()}"/>
                </div>
                <form onsubmit="jQuery.ajax({type:'POST',data:jQuery(this).serialize(), url:'/blogPost/saveComment',success:function(data,textStatus){jQuery('#commentUpdates').html(data);jQuery('#commentForm')[0].reset();},error:function(XMLHttpRequest,textStatus,errorThrown){}});return false" method="post" action="/blogPost/saveComment" id="commentForm">
                    <div style="height:50px; padding-top:10px">
                        <span class="col-sm-1">Author: </span>
                        <span class="col-sm-2 ">
                            <g:textField name="author" class="author form-control" id="authorId" value="${sec.username()}">
                            </g:textField>
                        </span>
                    </div>
                    <div>
                        <span class="col-sm-1">Comment: </span>
                        <span class="col-sm-3" >
                            <g:textArea name="comment" class="comment form-control" id="commentId" style="height:200px">
                            </g:textArea></span>
                    </div>
                    <g:hiddenField name="id" class="hiddenTitle" value="${this.blogPost.id}"/>
                    <div class="row col-sm-12">
                    <button id="submitButton" class="btn btn-default" name="saveComment" value="Submit">Submit Comment</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
    <script>

    </script>
</html>
