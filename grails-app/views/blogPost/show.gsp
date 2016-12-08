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

                <h2><span id="title">${this.blogPost.title}</span></h2>
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
                        <g:form class="row col-sm-2" resource="${this.blogPost}" method="DELETE">
                            <fieldset class="buttons col-sm-12">
                                <g:link class="edit" action="edit" resource="${this.blogPost}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
                        </g:form>
                </sec:ifAnyGranted>
            </div>
            <br>
        </div>
        <div>

            <br>

            <div class="col-sm-12">
                <div class="row"><h2>${this.blogPost.commentsSize()} Comments:</h2></div>
                <hr class="comment-hr">
                <div id="commentUpdates">
                    <g:render template='commentsTemplate' collection="${this.blogPost.comments}"/>
                </div>
                <g:formRemote id="commentForm" name='saveComment' url='[controller:"Comment", action:"saveComment"]'>
                    <div style="height:50px; padding-top:10px">
                        <span class="col-sm-1">Author: </span>
                        <span class="col-sm-2 ">
                       
                            <g:textField name="author" class="author form-control" id="authorId">
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
                        <g:submitButton id="submitButton" name="saveComment" value="Submit"/>

                    </div>
                </g:formRemote>
            </div>
        </div>
    </body>
    <script>
        $("#submitButton").on('submit', function() {
            $.ajax(
                {
                    type: 'POST',
                    data: $("#commentForm").serialize(),
                    url: '/comment/saveComment',
                    success: function (data, textStatus) {
                        $('#commentUpdates').html(data);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                }
            );
            return false
        }
    </script>
</html>
