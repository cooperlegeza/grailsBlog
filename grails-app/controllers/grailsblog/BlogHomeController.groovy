package grailsblog

class BlogHomeController {
	def BlogHome = {
		def blogs = []
		blogs = BlogPost.findAll()
		[blogs: blogs]
	}
}
