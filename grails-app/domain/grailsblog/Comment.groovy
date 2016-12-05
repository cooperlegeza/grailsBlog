package grailsblog

import java.util.Date

class Comment {

	String author
	String comment
	Date dateCreated

    def dayOfTheWeek() {
        return dateCreated.format('EEEE', timeZone)
    }
	static belongsTo = [blogPost:BlogPost]
    static constraints = {
		author(nullable:false)
		comment(nullable:false)
		
    }
	static mapping = {
		sort "dateCreated":"desc"
	}
}
