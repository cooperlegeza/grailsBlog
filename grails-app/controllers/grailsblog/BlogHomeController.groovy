package grailsblog



class BlogHomeController {
	def blogHome = {
		def blogs = []
		blogs = BlogPost.findAll()
		def tenMostRecentBlogs = []
		if(blogs.size < 10) {
			0.step blogs.size() - 1, 1 {
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
