<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>

    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/#"> THE MOST RADICAL BLOG IN THE WORLD, DUUUUDE
                </a>
            </div>
            <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
                <ul class="nav navbar-nav navbar-right">
                    <g:pageProperty name="page.nav" />
                </ul>
            </div>
            
        </div>
    </div>
	<div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
               <sec:ifAnyGranted roles='ROLE_ADMIN'>
	            <li><g:link class="create" controller="BlogPost" action="create">New post</g:link></li>
	            <li><g:link class="logout" controller="logout" method="post" asynchronous="false" onSuccess="location.reload()">Logout</g:link></li>
	           </sec:ifAnyGranted>
	           
	           <sec:ifAnyGranted roles='ROLE_USER'>
	           <li><g:link class="logout" controller="logout" method="post" asynchronous="false" onSuccess="location.reload()">Logout</g:link></li>
	           </sec:ifAnyGranted>
	           
	            <li><g:link class="list" controller="BlogPost" action="index">Post List</g:link></li>
	            <sec:ifNotLoggedIn>
				<li><g:link controller='login' action='auth'>Login</g:link></li>
				</sec:ifNotLoggedIn>
            </ul>
        </div>
    <g:layoutBody/>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
