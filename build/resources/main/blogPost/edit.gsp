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
            <g:form resource="${this.blogPost}" method="PUT">
                <g:hiddenField name="version" value="${this.blogPost?.version}" />
                <fieldset class="form">
                    <f:all bean="blogPost"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
