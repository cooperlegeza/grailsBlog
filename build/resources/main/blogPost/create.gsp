<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="blogLayout" />
        <g:set var="entityName" value="${message(code: 'blogPost.label', default: 'BlogPost')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body="container">
        <a href="#create-blogPost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        
        <div id="create-blogPost" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.blogPost}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.blogPost}" var="error">
                <li> <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <div class="row">
                        <div><b>Title: </b></div>
                        <div><g:textField name="title" id="titleId" /></div>
                    </div>
                    <div class="row">
                        <div><b>Text: </b></div>
                        <div><g:textArea name="text" id="textId" rows="10" cols="200"/></div>
                    </div>
                    <g:hiddenField name="author" value="${sec.username()}"/>
                </fieldset>
                <div class="row">
                    <g:submitButton name="Create" value="Create" class="save"><button class="btn btn-primary">Create</button></g:submitButton>
                </div>
            </g:form>
        </div>
    </body>
</html>
