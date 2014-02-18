package prode

import org.springframework.dao.DataIntegrityViolationException

class EquipoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [equipoInstanceList: Equipo.list(params), equipoInstanceTotal: Equipo.count()]
    }

    def create() {
        [equipoInstance: new Equipo(params)]
    }

    def save() {
        def equipoInstance = new Equipo(params)
        if (!equipoInstance.save(flush: true)) {
            render(view: "create", model: [equipoInstance: equipoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'equipo.label', default: 'Equipo'), equipoInstance.id])
        redirect(action: "show", id: equipoInstance.id)
    }

    def show(Long id) {
        def equipoInstance = Equipo.get(id)
        if (!equipoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipo.label', default: 'Equipo'), id])
            redirect(action: "list")
            return
        }

        [equipoInstance: equipoInstance]
    }

    def edit(Long id) {
        def equipoInstance = Equipo.get(id)
        if (!equipoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipo.label', default: 'Equipo'), id])
            redirect(action: "list")
            return
        }

        [equipoInstance: equipoInstance]
    }

    def update(Long id, Long version) {
        def equipoInstance = Equipo.get(id)
        if (!equipoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipo.label', default: 'Equipo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (equipoInstance.version > version) {
                equipoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'equipo.label', default: 'Equipo')] as Object[],
                          "Another user has updated this Equipo while you were editing")
                render(view: "edit", model: [equipoInstance: equipoInstance])
                return
            }
        }

        equipoInstance.properties = params

        if (!equipoInstance.save(flush: true)) {
            render(view: "edit", model: [equipoInstance: equipoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'equipo.label', default: 'Equipo'), equipoInstance.id])
        redirect(action: "show", id: equipoInstance.id)
    }

    def delete(Long id) {
        def equipoInstance = Equipo.get(id)
        if (!equipoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipo.label', default: 'Equipo'), id])
            redirect(action: "list")
            return
        }

        try {
            equipoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'equipo.label', default: 'Equipo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equipo.label', default: 'Equipo'), id])
            redirect(action: "show", id: id)
        }
    }
}
