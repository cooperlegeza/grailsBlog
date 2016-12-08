package grailsblog

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CommentController {

	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Comment.list(params), model:[commentCount: Comment.count()]
    }

    def create() {
        respond new Comment(params)
    }


    @Transactional
    def saveComment(){
        BlogPost post = BlogPost.findById(params.id)
        post.addToComments(new Comment(author:params.author,comment:params.comment)).save()
        redirect(controller: "BlogPost", action: "Show", id:post.id)
    }

    @Transactional
    def editComment(){
        Comment comment = Comment.findByAuthorAndDateCreated(params.author, params.dateCreated)
        comment.comment = params.comment
    }

    @Transactional
    def update(Comment comment) {
        if (comment == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (comment.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond comment.errors, view:'edit'
            return
        }

        comment.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'comment.label', default: 'Comment'), comment.id])
                redirect comment
            }
            '*'{ respond comment, [status: OK] }
        }
    }

    @Transactional
    def delete() {

        BlogPost post = BlogPost.findByTitle(params.title)
        Comment comment = Comment.findByDateCreatedAndAuthor(params.dateCreated, params.author)
        post.removeFromComments(comment)
        comment.delete()
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
