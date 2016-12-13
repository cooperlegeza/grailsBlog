package grailsblog

import grails.test.mixin.*
import org.omg.IOP.CodecOperations
import spock.lang.*

@TestFor(BlogPostController)
@Mock([BlogPost, Comment])
class BlogPostControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        params["author"] = 'Cooper'
        params["dateCreated"] = new Date()
        params["text"] = 'I am a blog post!'
        params["title"] = 'A new blog post'
        params["comments"] = []
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.blogPostList
            model.blogPostCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.blogPost!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def blogPost = new BlogPost()
            blogPost.validate()
            controller.save(blogPost)

        then:"The create view is rendered again with the correct model"
            model.blogPost!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            blogPost = new BlogPost(params)

            controller.save(blogPost)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/blogPost/show/1'
            controller.flash.message != null
            BlogPost.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def blogPost = new BlogPost(params)
            controller.show(blogPost)

        then:"A model is populated containing the domain instance"
            model.blogPost == blogPost
    }

    void "Test that the saveCommentWithoutRender action adds a comment to the blog post"(){
        when:
            populateValidParams(params)
            BlogPost post = new BlogPost(params)
            post.save(flush: true, validate: false)
            params.author = 'Author'
            params.comment = 'This is a comment'
            params.id = 1
            params.post = post
            controller.saveCommentWithoutRender()
            Comment comment = post.comments[0]

        then:
            post.comments.size() == 1
            comment.author == 'Author'
            comment.comment == 'This is a comment'
    }

    void "Test that the edit post action edits a post's text and title" (){
        when:
            populateValidParams(params)
            BlogPost post = new BlogPost(params)
            post.save(flush: true, validate: false)
            params.text = 'This is edited text'
            params.title = 'This is an edited title'
            controller.editPost(params, post)

        then:
            post.author == 'Cooper'
            post.title == 'This is an edited title'
            post.text == 'This is edited text'
            post.comments.size() == 0
    }
}
