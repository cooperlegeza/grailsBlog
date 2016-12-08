package grailsblog

import grails.test.mixin.*
import spock.lang.*

@TestFor(CommentController)
@Mock(Comment)
class CommentSpec extends Specification {

    def setup() {
        def blog = new BlogPost(author:'Cooper', title:'New Post', text:'This is the text of a blog post', dateCreated:new Date())
    }

    def cleanup() {

    }


}
