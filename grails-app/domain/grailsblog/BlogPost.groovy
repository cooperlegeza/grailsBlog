package grailsblog

class BlogPost {

	int FRONT_PAGE_POST_LENGTH_LIMIT = 200
	
	String title
	Date dateCreated
	String author
	String text

	def textForFrontPage (){

		String frontPageText = text.take(FRONT_PAGE_POST_LENGTH_LIMIT)
		if(frontPageText.length() == 200){
			frontPageText = frontPageText + "..."
		}
		return frontPageText
	}

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
