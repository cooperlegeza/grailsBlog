package grailsblog

import java.util.Date

class Comment {

	String author
	String comment
	Date dateCreated

	static belongsTo = [blogPost:BlogPost]
    static constraints = {
		author(nullable:false)
		comment(nullable:false)
		
    }
	static mapping = {
		sort "dateCreated":"desc"
	}
}
