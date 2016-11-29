package grailsblog

class User {
	
	String username
	String password

    static constraints = {
	password(password:true)
	}
	
	String toString(){
		name
	}
}
