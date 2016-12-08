package grailsblog

import grails.test.mixin.*
import spock.lang.*

@TestFor(BlogPostController)
@Mock(BlogPost)
class BlogPostControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        params["author"] = 'Cooper'
        params["dateCreated"] = new Date()
        params["text"] = 'I am a blog post!'
        params["title"] = 'A new blog post'
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

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def blogPost = new BlogPost(params)
            controller.edit(blogPost)

        then:"A model is populated containing the domain instance"
            model.blogPost == blogPost
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/blogPost/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def blogPost = new BlogPost()
            blogPost.validate()
            controller.update(blogPost)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.blogPost == blogPost

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            blogPost = new BlogPost(params).save(flush: true)
            controller.update(blogPost)

        then:"A redirect is issued to the show action"
            blogPost != null
            response.redirectedUrl == "/blogPost/show/$blogPost.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/blogPost/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def blogPost = new BlogPost(params).save(flush: true)

        then:"It exists"
            BlogPost.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(blogPost)

        then:"The instance is deleted"
            BlogPost.count() == 0
            response.redirectedUrl == '/blogHome'
            flash.message != null
    }
}
