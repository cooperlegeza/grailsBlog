package grailsblog

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BlogPostController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	

    def index(Integer max) {
	
        params.max = Math.min(max ?: 10, 100)
        respond BlogPost.list(params), model:[blogPostCount: BlogPost.count()]
    }

    def show(BlogPost blogPost) {
        def title = BlogPost.get(params.title)
        [title: title]
        respond blogPost
    }

    def create() {
        respond new BlogPost(params)
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

    def edit(BlogPost blogPost) {
        respond blogPost
    }

    @Transactional
    def update(BlogPost blogPost) {
        if (blogPost == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (blogPost.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond blogPost.errors, view:'edit'
            return
        }

        blogPost.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'blogPost.label', default: 'BlogPost'), blogPost.id])
                redirect blogPost
            }
            '*'{ respond blogPost, [status: OK] }
        }
    }

    @Transactional
    def delete(BlogPost blogPost) {

        if (blogPost == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        blogPost.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'blogPost.label', default: 'BlogPost'), blogPost.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
