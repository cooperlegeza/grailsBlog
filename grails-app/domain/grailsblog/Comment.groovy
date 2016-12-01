package grailsblog

import java.util.Date

class Comment {

	String author
	String content
	Date dateCreated
	
	static belongsTo = [blogPost:BlogPost]
    static constraints = {
		author(nullable:false)
		content(nullable:false)
		
    }
	static mapping = {
		sort "dateCreated":"desc"
	}
}
