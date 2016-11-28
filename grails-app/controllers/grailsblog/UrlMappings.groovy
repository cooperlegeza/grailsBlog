package grailsblog

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "blogHome", view: "blogHome")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
