package grailsblog

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:'BlogHome', action:'blogHome')
        "500"(view:'/error')
        "404"(view:'/notFound')

        name searchFriendlyURL: "/$year?/$month?/$day?/$title"{
            controller = 'BlogPost'
            action = 'show'
        }
    }
}
