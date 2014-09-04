package prode

import javax.transaction.Transaction;

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class PuntosFechaUsuarioController {
	
	def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def fec = Fecha.get()
		def puntos = PuntosFechaUsuario.findAllByFecha(fec)
		//PuntosFechaUsuario.list(params).sort{it.puntos}.reverse()
        [puntosFechaUsuarioInstanceList: puntos, puntosFechaUsuarioInstanceTotal: PuntosFechaUsuario.count(), campeonatos: Campeonato.list(params)]
    }
	
	def getFechas(){
		try{
		def list = Campeonato.findByNombre(params.campeonatos)
		//list = Campeonato.getAll()
		def fechas = list.fechas
		render fechas.sort{it.numeroFecha} as JSON
		//render list.collect{ """<option value="${it.id}">${it.name}</option>""" }
		} catch (Exception e) {
			render("Hubo Problemas al cargar las fechas")
		}
  } 
	
	def getPuntos(){
		try{
			def campe = Campeonato.findByNombre(params.campeonatos) 
			def campeFec = campe.fechas
			def fec = Fecha.get(params.fechas) 
			//def asda = campe.findByFechas(params.fechas) 

		def user = User.get(springSecurityService.principal.id)
		def puntos = PuntosFechaUsuario.findAllByFecha(fec).sort{it.puntos}.reverse()
		//def puntos = PuntosFechaUsuario.findAllByFecha(fec)
		def cant = puntos.count
		render(template:'puntosUsuarios', model:[puntosFechaUsuarioInstanceList:puntos])
		//render(puntos) 
		} catch (Exception e) {
			render("Hubo Problemas al cargar las fechas") 
		}
  } 
	
	def getPuntosByUser(){
		try{
			def campe = Campeonato.findByNombre(params.campeonatos).fechas
			def fec = Fecha.get(1)

		def user = User.get(springSecurityService.principal.id)
		def puntos = PuntosFechaUsuario.findByFechaAndUsuario(fec, user)
			
		render(puntos)
		} catch (Exception e) {
			render("Hubo Problemas al cargar las fechas")
		}
  }
	
	
	def calcularPuntos(){
		try{
			PuntosFechaUsuario.withTransaction{ status ->
			def fecha = Fecha.get(params.fechas)
			def partidos = Partido.where {fecha == fecha}
			def users = User.list()
			def puntos = 0
			users.each {
				def user = it
			partidos.each {
				def partido = it
					if(Apuesta.findByUsuarioAndPartido(user, partido)){
						def apuestaPartido = Apuesta.findByUsuarioAndPartido(user, it)
						if(it.golesEquipoLocal > it.golesEquipoVisitante & apuestaPartido.resultadoApostado == 'Local'){puntos += 3}
						else if(it.golesEquipoLocal < it.golesEquipoVisitante & apuestaPartido.resultadoApostado == 'Visitante'){puntos += 3}
						else if(it.golesEquipoLocal == it.golesEquipoVisitante & apuestaPartido.resultadoApostado == 'Empate'){puntos += 3}
					}
				}
			def puntosFecha = new PuntosFechaUsuario()
			puntosFecha.puntos = puntos
			puntosFecha.usuario = user
			puntosFecha.fecha = fecha
			puntosFecha.save(flush: true)
				
			}
			}
			render("Puntos calculados correctamente") 
		}
		catch(Exception e){
			render("Hubo Problemas al cargar las fechas") 
		}
		
	}
	

    def create() {
        [puntosFechaUsuarioInstance: new PuntosFechaUsuario(params)]
    }

    def save() {
        def puntosFechaUsuarioInstance = new PuntosFechaUsuario(params)
        if (!puntosFechaUsuarioInstance.save(flush: true)) {
            render(view: "create", model: [puntosFechaUsuarioInstance: puntosFechaUsuarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'puntosFechaUsuario.label', default: 'PuntosFechaUsuario'), puntosFechaUsuarioInstance.id])
        redirect(action: "show", id: puntosFechaUsuarioInstance.id)
    }

    def show(Long id) {
        def puntosFechaUsuarioInstance = PuntosFechaUsuario.get(id)
        if (!puntosFechaUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'puntosFechaUsuario.label', default: 'PuntosFechaUsuario'), id])
            redirect(action: "list")
            return
        }

        [puntosFechaUsuarioInstance: puntosFechaUsuarioInstance]
    }

    def edit(Long id) {
        def puntosFechaUsuarioInstance = PuntosFechaUsuario.get(id)
        if (!puntosFechaUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'puntosFechaUsuario.label', default: 'PuntosFechaUsuario'), id])
            redirect(action: "list")
            return
        }

        [puntosFechaUsuarioInstance: puntosFechaUsuarioInstance]
    }

    def update(Long id, Long version) {
        def puntosFechaUsuarioInstance = PuntosFechaUsuario.get(id)
        if (!puntosFechaUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'puntosFechaUsuario.label', default: 'PuntosFechaUsuario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (puntosFechaUsuarioInstance.version > version) {
                puntosFechaUsuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'puntosFechaUsuario.label', default: 'PuntosFechaUsuario')] as Object[],
                          "Another user has updated this PuntosFechaUsuario while you were editing")
                render(view: "edit", model: [puntosFechaUsuarioInstance: puntosFechaUsuarioInstance])
                return
            }
        }

        puntosFechaUsuarioInstance.properties = params

        if (!puntosFechaUsuarioInstance.save(flush: true)) {
            render(view: "edit", model: [puntosFechaUsuarioInstance: puntosFechaUsuarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'puntosFechaUsuario.label', default: 'PuntosFechaUsuario'), puntosFechaUsuarioInstance.id])
        redirect(action: "show", id: puntosFechaUsuarioInstance.id)
    }

    def delete(Long id) {
        def puntosFechaUsuarioInstance = PuntosFechaUsuario.get(id)
        if (!puntosFechaUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'puntosFechaUsuario.label', default: 'PuntosFechaUsuario'), id])
            redirect(action: "list")
            return
        }

        try {
            puntosFechaUsuarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'puntosFechaUsuario.label', default: 'PuntosFechaUsuario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'puntosFechaUsuario.label', default: 'PuntosFechaUsuario'), id])
            redirect(action: "show", id: id)
        }
    }
}
