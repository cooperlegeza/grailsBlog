<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="blogLayout" />
        <g:set var="entityName" value="${message(code: 'blogPost.label', default: 'BlogPost')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-blogPost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
 
        <div id="edit-blogPost" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.blogPost}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.blogPost}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.blogPost}" class="col-sm-8" method="PUT" action="update">
                <g:hiddenField name="version" value="${this.blogPost?.version}" />
                <fieldset class="form">
                    <div class="row">
                        <div><b>Title: </b></div>
                        <div><g:textField value="${this.blogPost.title}" name="title" id="titleId" /></div>
                    </div>
                    <div class="row">
                        <div><b>Text: </b></div>
                        <div><g:textArea value="${this.blogPost.text}" name="text" id="textId" rows="20" cols="300"/></div>
                    </div>
                    <g:hiddenField name="author" value="${this.blogPost.author}"/>
                </fieldset>
                <div class="row">
                    <g:submitButton name="Update" value="Edit Post" class="save"><button class="btn btn-primary">Edit Post</button></g:submitButton>
                </div>
            <br/>
            </g:form>
        </div>
    </body>
</html>
