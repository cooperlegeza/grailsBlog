package grailsblog

class BlogPost {

	static searchable ={
		only = 'title'
	}
	
	String title
	Date dateCreated
	String author
	String text
	List comments

	static hasMany = [comments:Comment]
    static constraints = {
		title(blank:false)
		author(nullable:true)
		text(size:0..5000, nullable:true)
    }
	
	static mapping = {
		sort "dateCreated":"desc"
		text type: "text"
	}
}
