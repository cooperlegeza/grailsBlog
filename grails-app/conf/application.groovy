

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'org.example.SecUser'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'org.example.SecUserSecRole'
grails.plugin.springsecurity.authority.className = 'org.example.SecRole'
grails.plugin.springsecurity.fii.rejectPublicInvocations = false
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/BlogHome/blogHome',   access: ['permitAll']],
	[pattern: '/BlogPost/create',   access: ['ROLE_ADMIN']],
	[pattern: '/BlogPost/save',   access: ['ROLE_ADMIN']],
	[pattern: '/BlogPost/index',   access: ['permitAll']],
	[pattern: '/BlogPost/show',   access: ['permitAll']],
	[pattern: '/BlogPost/edit',   access: ['ROLE_ADMIN']],
	[pattern: '/BlogPost/searchResult',   access: ['permitAll']],
	[pattern: '/BlogPost/saveComment', access: ['permitAll']],
	
	[pattern: '/Comment/create',   access: ['permitAll']],
	[pattern: '/Comment/save',   access: ['permitAll']],
	[pattern: '/Comment/show',   access: ['permitAll']],
	
	[pattern : '/', access: ['permitAll']],
	
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/BlogPost/index',  access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/logout/logout', access:  ['permitAll']],
	[pattern: '/comment/**', 	access:  ['permitAll']],
	[pattern: '/blogPost/**', access: ['ROLE_ADMIN']]
]
grails.plugins.springsecurity.interceptUrlMap = [
	 '/**': ["IS_AUTHENTICATED_FULLY"]
	]
grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]




