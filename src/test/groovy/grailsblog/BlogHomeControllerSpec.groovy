package grailsblog

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(BlogHomeController)
class BlogHomeControllerSpec extends Specification {

    def setup() {

    }

    def cleanup() {
    }

    void "tenMostRecent correctly pulls ten and they are in the correct order"() {
        List blogs = []
        0.step 15, 1, {
            blogs[it] = new BlogPost(title:it, author:it, text: it, dateCreated: new Date())
        }
        blogs.sort{a,b -> a.dateCreated <=> b.dateCreated}
        blogs.reverse()

        List blogsTopTen = controller.tenMostRecent(blogs)

        expect:
            blogsTopTen.size == 10

        0.step blogsTopTen.size() - 2, 1, {
            expect:
                blogsTopTen.get(it).dateCreated > blogsTopTen.get(it + 1).dateCreated
        }

    }
}
