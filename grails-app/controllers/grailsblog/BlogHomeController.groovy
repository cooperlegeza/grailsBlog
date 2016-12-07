package grailsblog



class BlogHomeController {
	def blogHome = {
		def blogs = []
		blogs = BlogPost.findAll()
		def tenMostRecentBlogs = []
		def size = blogs.size()
		if(blogs.size < 10) {
			0.step size, 1, {
				tenMostRecentBlogs.add(it, blogs.get(it))
			}
		} else {
			0.step 9, 1, {
				tenMostRecentBlogs.add(it, blogs.get(it))
			}
		}


		[blogs: blogs, mostRecent: tenMostRecentBlogs]
		
	}
}
