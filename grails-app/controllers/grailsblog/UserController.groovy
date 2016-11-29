package grailsblog

class UserController {

    def login() { }
	
	def authenticate = {
		def user = User.findByUsernameAndPassword(params.username, params.password)
		if(user){
		  session.user = user
		  flash.message = "Hello ${user.username}!"
		  redirect(controller:"blogHome", action:"blogHome")
		}else{
		  flash.message = "Sorry, ${params.username}. Please try again."
		  redirect(action:"login")
		}
	  }
	  
	  def logout = {
		flash.message = "Goodbye ${session.user.username}"
		session.user = null
		redirect(controller:"entry", action:"list")
	  }
}
