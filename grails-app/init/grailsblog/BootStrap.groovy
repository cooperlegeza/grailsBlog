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
		def post2 = new BlogPost(title:'Ipsun, Go!', author:'Cooper',
				text:'\n' +
						'\n' +
						'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam urna velit, auctor quis pharetra et, molestie at ante. Donec nec auctor nisl. Nulla quis enim id tellus cursus congue ac sit amet arcu. Morbi in risus vitae mi venenatis lacinia eget at tellus. Pellentesque a euismod nisl, aliquet facilisis risus. Vivamus euismod ex turpis, at lobortis urna viverra at. Aliquam tellus sem, maximus nec nisi sed, aliquet dapibus libero. Ut in eleifend nisl. Pellentesque porta ante sed orci gravida, id mollis diam sollicitudin. Nunc mauris turpis, aliquet a nisl at, dignissim iaculis nisi. Nam et quam nec lectus posuere gravida.\n' +
						'\n' +
						'Nam urna neque, commodo vitae accumsan non, semper nec turpis. Nulla nec tempor est. Nunc molestie id urna nec sollicitudin. Aliquam lacinia faucibus feugiat. Fusce eget iaculis dui, eu porta tellus. Quisque dolor purus, finibus ut faucibus in, convallis et leo. Mauris non efficitur mauris. Aliquam semper orci sit amet tellus venenatis, quis posuere lectus vestibulum.\n' +
						'\n' +
						'Phasellus sodales libero quis fringilla lobortis. Nulla finibus enim sit amet mi faucibus viverra. Nunc condimentum dolor vel iaculis accumsan. Donec vitae tincidunt lorem. Nullam ac sem vitae risus mattis pellentesque. Aenean pretium quam in vehicula sagittis. Mauris vel urna porttitor, facilisis massa vitae, posuere turpis. Sed aliquet sagittis nisi, vitae varius nisi pellentesque et. Pellentesque a purus ullamcorper, porttitor orci ut, ullamcorper metus. Aliquam vitae magna sapien. Etiam eu felis mollis, commodo dui elementum, vehicula massa.\n' +
						'\n' +
						'Phasellus ornare, ligula sit amet egestas gravida, elit dolor sodales sapien, at finibus magna urna ultrices libero. Fusce enim odio, commodo sed aliquam dictum, scelerisque nec sem. Morbi ut urna sit amet erat iaculis egestas nec ac erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur iaculis ex et finibus elementum. Etiam ligula nulla, eleifend in sem id, bibendum vestibulum dolor. Praesent interdum ligula id massa imperdiet, id vulputate enim rutrum. Proin a metus vel dolor pretium dignissim vitae a massa. Praesent vulputate eget felis nec hendrerit. Aliquam erat volutpat. Sed consequat, est dictum mollis porta, metus tortor posuere nibh, condimentum condimentum sem erat id turpis. Integer viverra nunc id accumsan ultricies. Maecenas placerat risus at interdum hendrerit. Vivamus vitae nibh ante.\n' +
						'\n' +
						'Mauris euismod commodo eros et egestas. Phasellus lacinia, orci id efficitur ultrices, neque eros pharetra orci, vitae ultricies diam orci vitae nunc. Donec purus nisi, semper eu scelerisque fringilla, venenatis a neque. Sed nunc sapien, semper et nunc ut, finibus consectetur dolor. Ut nisl elit, egestas sed lectus a, tincidunt sollicitudin arcu. Nulla ullamcorper tincidunt vehicula. Aliquam placerat mattis ipsum vitae porta. ',
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
