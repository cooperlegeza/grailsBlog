package grailsblog

class BlogPost {
	
	String title
	Date dateCreated
	String author
	String text
	static hasMany = [comment:Comment]
    static constraints = {
		title(blank:false)
		author(nullable:true)
		text(size:0..5000, nullable:true)
    }
	
	static mapping = {
		sort "dateCreated":"desc"
	}
}
