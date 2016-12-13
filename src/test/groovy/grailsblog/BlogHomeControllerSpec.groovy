package grailsblog

import grails.test.mixin.*
import spock.lang.Specification

import java.text.SimpleDateFormat

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(BlogHomeController)
@Mock(BlogPost)
class BlogHomeControllerSpec extends Specification {
    def MONTHS = ["January", "February", "March", "April", "May", "June", "July",
                  "August", "September", "October", "November", "December"]

    def setup() {

    }

    def cleanup() {
    }

    void "Test tenMostRecent pulls ten and they are in descending order by date created"() {
        List blogs = []
        0.step 15, 1, {
            blogs[it] = new BlogPost(title:it, author:it, text: it).save(flush:true, validate: false)
        }
        blogs.sort{a,b -> b.dateCreated <=> a.dateCreated}

        ArrayList blogsTopTen = controller.tenMostRecent(blogs)

        0.step blogsTopTen.size() - 2, 1, {
            assert blogsTopTen.get(it).dateCreated > blogsTopTen.get(it + 1).dateCreated
        }

        expect:
            blogsTopTen.size == 10

    }

    void "Test tenMostRecent pulls all from a list if there is less than ten in the list"(){
        List blogs = []
        0.step 6, 1, {
            blogs[it] = new BlogPost(title:it, author:it, text: it).save(flush: true, validate:false)
        }
        blogs.sort{a,b -> b.dateCreated <=> a.dateCreated}

        def blogsTopTen = controller.tenMostRecent(blogs)

        0.step blogsTopTen.size() - 2, 1, {
            assert blogsTopTen.get(it).dateCreated > blogsTopTen.get(it + 1).dateCreated
        }

        expect:
        blogsTopTen.size == 6

    }

    void "Test blogsByMonthAndYear returns all objects sorted by year, then inside of the year sorted by month"(){
        def initialDate = Date.parse("dd-MM-yyyy", "01-06-2013")
        def range = 1095
        def monthFormat = new SimpleDateFormat("MMMM")
        def yearFormat = new SimpleDateFormat("YYYY")

        def blogs = []
        0.step 20, 1, {
            def randomInterval = new Random().nextInt(range)
            def randomDate = initialDate + randomInterval
            blogs[it] = new BlogPost(title:it, author:it, text: it)

            blogs[it].metaClass.getDateCreated = {-> randomDate}
            blogs[it].save(flush:true, validate:false)

            blogs[it].dateCreated = blogs[it].dateCreated
            blogs[it].author = blogs[it].author
            blogs[it].save(flush: true, validate: false)
        }

        def allBlogs = controller.blogsByMonthAndYear(blogs)
        def blogCount = 0

        allBlogs.each {
            def year = it.value
            def yearName = it.key
            def monthCount = 0

            year.each {
                monthCount++
                def monthName = it.key
                def month = it.value

                expect:
                    MONTHS.contains(monthName)

                month.each { blog ->
                    blogCount++
                    def blogMonth = monthFormat.format(blog.dateCreated)
                    def blogYear = yearFormat.format(blog.dateCreated)
                    assert blogYear == yearName
                    assert blogMonth == monthName
                }
            }
            assert monthCount == 12
        }
        expect:
            blogCount == 20
    }

    void "Test createYearMap returns a map with twelve nodes, each a string of one of the months of the year, in month order"(){
        def yearMap = controller.createYearMap()


        MONTHS.eachWithIndex { month, index ->
            assert yearMap.keySet()[index] == MONTHS[index]
        }
        yearMap.keySet().each { key ->
            assert MONTHS.contains(key)
        }

        expect:
            yearMap.size() == 12

    }

}
