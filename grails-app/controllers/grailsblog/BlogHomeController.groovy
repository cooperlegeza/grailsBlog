package grailsblog



class BlogHomeController {
	def blogHome = {
		def blogs = []
		blogs = BlogPost.findAll()
		[blogs: blogs]
		
	}
}
