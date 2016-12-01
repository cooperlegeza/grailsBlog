package grailsblog

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

		//"/"(views:'/index')
     "/"(controller:'BlogHome', action:'blogHome')
		/*"/login/$action?"(controller: "BlogPost")
		"/logout/$action?"(controller: "logout")*/
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
