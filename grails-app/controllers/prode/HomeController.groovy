package prode
import grails.plugins.springsecurity.Secured

class HomeController {
	
	def springSecurityService
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index() { 
			def user = User.get(springSecurityService.principal.id)	
    }
}
