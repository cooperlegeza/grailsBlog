package grailsblog

class BlogPost {
	
	String title
	Date dateCreated
	String author
	String text
	static hasMany = [comments:Comment]
    static constraints = {
		title(blank:false)
		author(nullable:true)
		text(size:0..5000, nullable:true)
    }
	
	static mapping = {
		sort "dateCreated":"desc"
		comments sort: 'dateCreated', order: 'desc'
		text type: "text"
	}
}
