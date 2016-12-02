package grailsblog

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:'BlogHome', action:'blogHome')
        "/$title" (controller:'BlogPost', action:'show')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
