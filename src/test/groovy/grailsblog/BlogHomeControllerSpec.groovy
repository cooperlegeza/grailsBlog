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

    void "tenMostRecent pulls ten and they are in descending order by date created"() {
        List blogs = []
        0.step 15, 1, {
            blogs[it] = new BlogPost(title:it, author:it, text: it, dateCreated: new Date())
        }
        blogs.sort{a,b -> b.dateCreated <=> a.dateCreated}

        blogsTopTen = controller.tenMostRecent(blogs)

        expect:
            blogsTopTen.size == 10

        0.step blogsTopTen.size() - 2, 1, {
            expect:
                blogsTopTen.get(it).dateCreated > blogsTopTen.get(it + 1).dateCreated
        }

    }

    void "blogsByMonthAndYear returns all objects sorted by year, then inside of the year sorted by month"(){
        def initialDate = Date.parse("dd-MM-yyyy", "01-06-2013")
        int range = 1095

        List blogs = []
        0.step 20, 1, {
            def randomInterval = new Random().nextInt(range)
            def randomDate = initialDate + randomInterval
            blogs[it] = new BlogPost(title:it, author:it, text: it, dateCreated:randomDate)
        }


    }
}
