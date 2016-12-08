package grailsblog

import java.awt.List

class BlogHomeController {
	def blogHome = {
		def blogs = []
		blogs = BlogPost.findAll()
		def tenMostRecentBlogs = tenMostRecent(blogs)

		[blogs: blogs, mostRecent: tenMostRecentBlogs]
		
	}

	def tenMostRecent(ArrayList listOfSortedBlogs) {
		def tenMostRecentBlogs = []
		def size = listOfSortedBlogs.size()
		if(listOfSortedBlogs.size < 10) {
			0.step size, 1, {
				tenMostRecentBlogs.add(it, listOfSortedBlogs.get(it))
			}
		} else {
			0.step 10, 1, {
				tenMostRecentBlogs.add(it, listOfSortedBlogs.get(it))
			}
		}
		return tenMostRecentBlogs
	}
}
