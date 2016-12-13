package grailsblog

import javax.sql.rowset.spi.TransactionalWriter
import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BlogPostController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	

    def index(Integer max) {
	
        params.max = Math.min(max ?: 10, 100)
        respond BlogPost.list(params), model:[blogPostCount: BlogPost.count()]
    }

	def searchResult(){
		def postList = BlogPost.findAllByTitleIlike("%" + params.searchText + "%")
		 render(view:'SearchResult' , model:[postList: postList])
		
		
	}
    def show(BlogPost blogPost) {
        def title = BlogPost.get(params.title)
        [title: title]
        respond blogPost
    }

    def create() {
        def post = new BlogPost(params)
        respond post
    }

    @Transactional
    def saveComment(){
        BlogPost post = saveCommentWithoutRender(params)
        render(template:'commentsTemplate', collection:post.comments.reverse())
    }

    def saveCommentWithoutRender(params){
        BlogPost post = BlogPost.findById(params.id)
        Comment comment = new Comment(author:params.author,comment:params.comment)
        comment.save(flush:true)
        post.addToComments(comment)
        post.save(flush:true)
        post.refresh()
        return post
    }

    @Transactional
    def save(BlogPost blogPost) {
        if (blogPost == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (blogPost.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond blogPost.errors, view:'create'
            return
        }

        blogPost.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'blogPost.label', default: 'BlogPost'), blogPost.id])
                redirect blogPost
            }
            '*' { respond blogPost, [status: CREATED] }
        }
    }

    def edit(BlogPost post) {
        respond post
    }

    def editPost(params, post){
        post.text = params.text
        post.title = params.title
        post.save(flush:true)
        post.refresh()
        return post
    }

    @Transactional
    def update(BlogPost post) {
        post = editPost(params, post)
        redirect(action: "show", id:post.id)
    }

    @Transactional
    def delete(BlogPost blogPost) {
        blogPost.delete(flush:true)
        redirect(controller:'blogHome', action:'blogHome')

    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'blogPost.label', default: 'BlogPost'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

}
