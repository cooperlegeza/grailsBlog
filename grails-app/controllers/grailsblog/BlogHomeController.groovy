package grailsblog

import java.text.SimpleDateFormat

class BlogHomeController {

	def MONTH_FORMAT = new SimpleDateFormat("MMMM")
	def YEAR_FORMAT = new SimpleDateFormat("YYYY")
	def MONTHS = ["January", "February", "March", "April", "May", "June", "July",
				  "August", "September", "October", "November", "December"]

	def blogHome = {
		def blogs = []
		blogs = BlogPost.findAll()
		def tenMostRecentBlogs = tenMostRecent(blogs)
		def blogsByMonthAndYear = blogsByMonthAndYear(blogs)

		[mostRecent: tenMostRecentBlogs, blogsByDate: blogsByMonthAndYear]
		
	}

	def tenMostRecent(blogs) {
		def tenMostRecentBlogs = []
		def size = blogs.size()
		if(blogs.size < 10) {
			0.step size, 1, {
				tenMostRecentBlogs.add(it, blogs.get(it))
			}
		} else {
			0.step 10, 1, {
				tenMostRecentBlogs.add(it, blogs.get(it))
			}
		}

		return tenMostRecentBlogs
	}

	def blogsByMonthAndYear(blogs) {
		def years = new TreeMap()

		blogs.each { blog ->
			def year = years.get(YEAR_FORMAT.format(blog.dateCreated))

			if(year.equals(null)) {
				year = createYearMap()
				years.put(YEAR_FORMAT.format(blog.dateCreated), year)
			}
			putBlogByMonth(blog, year)
		}

		return years
	}

	def createYearMap() {
		def year = new LinkedHashMap()
		for(def count = 0; count < MONTHS.size(); count++){
			year.put(MONTHS[count], new ArrayList())
		}
		return year
	}

	def putBlogByMonth(blog, yearMap){
		def month = yearMap.get(MONTH_FORMAT.format(blog.dateCreated))
		month << blog
	}

}
