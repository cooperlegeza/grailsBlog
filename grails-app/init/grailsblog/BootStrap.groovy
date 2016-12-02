package grailsblog

import org.example.SecRole
import org.example.SecUser
import org.example.SecUserSecRole

class BootStrap {

    def init = { servletContext ->
		def adminRole = new SecRole(authority: 'ROLE_ADMIN').save()
		def userRole = new SecRole(authority: 'ROLE_USER').save()
		def post = new BlogPost(title:'Hello!', author:'Cooper',
				text:'I am a blog post! I would enjoy it if you read me,' +
						'and or destroyed the world!', dateCreated: new Date()).save()
		
		def adminUser = new SecUser(username: 'me', password: 'password').save()
		def regularUser2 = new SecUser(username: 'user', password: 'password').save()
		
		
			  SecUserSecRole.create adminUser, adminRole
			  SecUserSecRole.create regularUser2, userRole
		
			  SecUserSecRole.withSession {
				 it.flush()
				 it.clear()
			  }
			  assert SecUser.count() == 2
			  assert SecRole.count() == 2
			  assert SecUserSecRole.count() == 2
    }
    def destroy = {
    }
}
