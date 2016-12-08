package grailsblog

class BlogPost {

	int FRONT_PAGE_POST_LENGTH_LIMIT = 200

	static searchable ={
		only = 'title'
	}
	
	String title
	Date dateCreated
	String author
	String text
	List comments

	def commentsSize(){
		return comments.size()
	}

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
