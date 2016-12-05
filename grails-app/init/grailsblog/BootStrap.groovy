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
		def post2 = new BlogPost(title:'Bacon, Go!', author:'Cooper',
				text:'Bacon ipsum dolor amet alcatra meatloaf boudin brisket shoulder prosciutto turducken turkey t-bone tongue fatback porchetta filet mignon venison chicken. Pastrami shoulder ham hock salami spare ribs brisket. Pork belly corned beef t-bone filet mignon, landjaeger pork boudin ball tip tenderloin. Shank ribeye brisket, leberkas meatloaf burgdoggen fatback cow andouille.\n' +
						'\n' +
						'Tongue ball tip shoulder ham andouille biltong. Drumstick meatloaf prosciutto ham hock, hamburger pork chop landjaeger filet mignon cupim andouille. Cow chuck chicken meatball porchetta kielbasa shankle rump kevin meatloaf. Burgdoggen cow andouille picanha shank, pastrami shoulder biltong pork loin chuck flank. Sirloin tongue prosciutto venison picanha tail pork chop. Tenderloin chicken doner meatball landjaeger jerky kielbasa shoulder capicola tail shank tongue burgdoggen.\n' +
						'\n' +
						'Turkey pork loin tri-tip, jowl pastrami cow andouille cupim sirloin kielbasa shankle shank bresaola. Ham corned beef capicola, tongue swine fatback landjaeger. Turkey short loin prosciutto, tail pork chop shank cupim ham pastrami chicken short ribs strip steak rump jerky. Pork chop turkey shank jerky pastrami, alcatra corned beef brisket picanha ham. Cupim andouille salami hamburger, turkey meatloaf bresaola landjaeger ham jerky turducken pork belly biltong. Pork beef ribs filet mignon pork belly leberkas capicola pig corned beef spare ribs doner strip steak pancetta brisket venison. Ham filet mignon shoulder, pork chop cow tri-tip sirloin meatloaf pork loin hamburger shank boudin jerky.',
						dateCreated: new Date()).save()

		
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
