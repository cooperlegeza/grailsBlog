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
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="alert alert-danger alert-dismissable" role="status">${flash.message}</div>
            </g:if>
            <div class="col-12-sm">
                <div class="row"><h1><b>${this.blogPost.title}</b></h1></div>
                <div class="row postStyle">${this.blogPost.text}</div>
                <div>Posted by: ${this.blogPost.author}</div>
                <div>Posting date: ${this.blogPost.dateCreated}</div>
            </div>
            <hr>
            <br>
            <div>Comments:</div>
            <g:each in="${this.blogPost.comment}">
                1
            </g:each>
    		  
            <sec:ifAnyGranted roles='ROLE_ADMIN'>
                <g:form resource="${this.blogPost}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${this.blogPost}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </sec:ifAnyGranted>
        </div>
    </body>
  
</html>
