<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="blogLayout" />
        <g:set var="entityName" value="${message(code: 'blogPost.label', default: 'BlogPost')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body class="container">
        <a href="#show-blogPost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        
        <div id="show-blogPost" class="content scaffold-show row" role="main">
            <h1>${this.blogPost.title}</h1>
            <g:if test="${flash.message}">
            <div class="alert alert-danger alert-dismissable" role="status">${flash.message}</div>
            </g:if>
            <div>
                <sec:ifAnyGranted roles='ROLE_ADMIN'>
                    <div class="col-sm-12">
                        <g:form resource="${this.blogPost}" method="DELETE">
                            <fieldset class="buttons col-sm-6">
                                <g:link class="edit" action="edit" resource="${this.blogPost}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
                        </g:form>
                    </div>
                </sec:ifAnyGranted>
                <div class="row col-sm-12 postStyle">${this.blogPost.text}</div>
                <div class="row">
                        <h4><span>Posted by: ${this.blogPost.author}</span>
                        <span class="pull-right">Posting date: ${this.blogPost.dateCreated}</span>
                        </h4>
                </div>
            </div>
            <hr>
            <br>
            <g:form action="saveComment" controller="Comment">
                    <div>
                        <span class="col-sm-1">Author: </span>
                        <span class="col-sm-11">
                            <g:textField name="author" class="author" id="authorId" params="${[author: author]}">
                            </g:textField>
                        </span>
                    </div>
                    <div>
                        <span class="col-sm-1">Comment: </span>
                        <span class="col-sm-11">
                            <g:textArea name="comment" class="comment" id="commentId" params="${[comment: comment]}">
                            </g:textArea></span>
                    </div>
                    <g:hiddenField name="title" value="${this.blogPost.title}"/>
                    <div class="row col-sm-12">
                        <g:submitButton name="saveComment" value="Submit"/>
                    </div>
                </div>
            </g:form>

            <div class="col-sm-12">
                <div class="row"><h2>Comments:</h2></div>
                <hr class="comment-hr">
                <g:each in="${this.blogPost.comments}">
                    <div class="row">
                        <span>
                            <h3>${it.author}</h3>
                        </span>
                        <span class="pull-right">
                            <h4>Posting date: ${it.dateCreated}</h4>
                        </span>
                    </div>
                    <div class="comment-border row">${it.comment}</div>
                    <hr>
                    <br>
                </g:each>
            </div>
        </div>
    </body>
</html>
