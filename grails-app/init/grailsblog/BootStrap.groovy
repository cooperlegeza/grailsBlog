package grailsblog

class BootStrap {

    def init = { servletContext ->
		new User(username:'user',password:'password').save()
    }
    def destroy = {
    }
}
