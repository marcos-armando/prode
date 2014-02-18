package prode

import org.springframework.dao.DataIntegrityViolationException

class ApuestaController {
	
	def springSecurityService
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def index() {
		redirect(action: "list", params: params)
	}
	
	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[fechaInstanceList: Fecha.list(params), fechaInstanceTotal: Fecha.count()]
	}
	
	def create(Long id) {		
		
		// get an fecha
		def fecha = Fecha.get(id)
		
		// GORM Where
		def partido = Partido.where {
			fecha == fecha
        }
		
		//def partido = fecha.partidos
		
		def user = User.get(springSecurityService.principal.id)
		if(fecha.partidos){
			if(Apuesta.findByUsuarioAndPartido(user, partido.first())){
				redirect(action: "edit", id : id.value)
			}
		}
			[partidoInstanceList: partido.list(params), partidoInstanceTotal: partido.count(), fechas: Fecha.list(params)]

		//def partido = Partido.findByFecha(Fecha.get(1))
		

    }
	
	def save() {
		/*def apuestaPartido = new ResultadoApuesta(params)
		if (!apuestaPartido.save(flush: true)) {
			render(view: "create", model: [apuestaPartido: apuestaPartido])
			return
		}
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'partido.label', default: 'Partido'), apuestaPartido.id])
		redirect(action: "show", id: apuestaPartido.id)*/

		redirect(action: "list", params: params)

	}
	
	def edit(Long id) {
		
		def fecha = Fecha.get(id)
		def partidos = Partido.where {
			fecha == fecha
        }
		
		def apuestas = []
		def i = 0
		partidos.each {
			def apuesta = Apuesta.where {
				partido == it
			}
			//def usuario1 = Usuario.first()
			def user = User.get(springSecurityService.principal.id)
			apuestas <<  Apuesta.findByUsuarioAndPartido(user, it)

		}
			
		//return
		
		/*if (!campeonatoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'campeonato.label', default: 'Campeonato'), id])
			redirect(action: "list")
			return
		}*/

		     [partidoInstanceList: partidos.list(params), partidoInstanceTotal: partidos.count(), apuestasList : apuestas]
	}
	
	def show(Long id) {
		def partidoInstance = Partido.findByFecha(Fecha.get(1))

		if (!partidoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'partido.label', default: 'Partido'), id])
			redirect(action: "list")
			return
		}

		[partidoInstance: partidoInstance]
	}
	
	def getJson(){
		try {
			def list = params.resultados
			def a = list.split("-")
			a.each {
				def b = it.split("/")
				//render (b[1] + "@")
				
				def apuestaPartido = new Apuesta()
				apuestaPartido.partido = Partido.findById(b[0])
				apuestaPartido.resultadoApostado = b[1]
				apuestaPartido.usuario = User.get(springSecurityService.principal.id)  //Usuario.first()
				if (!apuestaPartido.save(flush: true)) {
					//render(view: "create", model: [apuestaPartido: apuestaPartido])
				}
			}
			render("Resultados guardados correctamente")
		} catch (Exception e) {
			render("Hubo Problemas al guardar los resultados. Porfavor vuelva a guardarlos")
		}		
	}
	
	def actualizar(){
		try {
			def list = params.resultados
			def a = list.split("-")
			a.each {
				def b = it.split("/")
				//render (b[1] + "@")
				def partido1 = Partido.findById(b[0])
				//def usuario1 = Usuario.first()
				def user = User.get(springSecurityService.principal.id)
				def apuestaPartido = Apuesta.findByUsuarioAndPartido(user, partido1)
				apuestaPartido.resultadoApostado = b[1]
				if (!apuestaPartido.save(flush: true)) {
					//render(view: "create", model: [apuestaPartido: apuestaPartido])
				}
			}
			render("Resultados actualizados correctamente")
		} catch (Exception e) {
			render("Hubo Problemas al guardar los resultados. Porfavor vuelva a guardarlos")
		}
	
	}
	
}
