<!doctype html>
<html lang="en" class="no-js">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>
        <g:layoutTitle default="RadicalBlog"/>
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
                <a class="navbar-brand" href="/#"> A Blog
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
            <div class="form-group">
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
				<li><g:link controller='login' action='auth' class="login-button">Login</g:link></li>
				</sec:ifNotLoggedIn>

            <g:form name="searchResult" url="[controller:'BlogPost',action:'searchResult']">
							<div class="form-group">
                            <li><g:textField name="searchText" class="search form-control input-sm input-search" id="searchText" >
                            </g:textField></li>
                            <li>
                        <g:submitButton name="searchPost" class="btn btn-default btn-sm" value="Search">
                        <span class="glyphicon glyphicon-search"></span> </g:submitButton>
                        </li>
                </g:form>
				</div>
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
