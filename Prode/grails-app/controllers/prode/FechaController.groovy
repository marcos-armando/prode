package prode

import org.springframework.dao.DataIntegrityViolationException

class FechaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [fechaInstanceList: Fecha.list(params), fechaInstanceTotal: Fecha.count()]
    }

    def create() {
        [fechaInstance: new Fecha(params)]
    }

    def save() {
        def fechaInstance = new Fecha(params)
        if (!fechaInstance.save(flush: true)) {
            render(view: "create", model: [fechaInstance: fechaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'fecha.label', default: 'Fecha'), fechaInstance.id])
        redirect(action: "show", id: fechaInstance.id)
    }

    def show(Long id) {
        def fechaInstance = Fecha.get(id)
        if (!fechaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fecha.label', default: 'Fecha'), id])
            redirect(action: "list")
            return
        }

        [fechaInstance: fechaInstance]
    }

    def edit(Long id) {
        def fechaInstance = Fecha.get(id)
        if (!fechaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fecha.label', default: 'Fecha'), id])
            redirect(action: "list")
            return
        }

        [fechaInstance: fechaInstance]
    }

    def update(Long id, Long version) {
        def fechaInstance = Fecha.get(id)
        if (!fechaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fecha.label', default: 'Fecha'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (fechaInstance.version > version) {
                fechaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'fecha.label', default: 'Fecha')] as Object[],
                          "Another user has updated this Fecha while you were editing")
                render(view: "edit", model: [fechaInstance: fechaInstance])
                return
            }
        }

        fechaInstance.properties = params

        if (!fechaInstance.save(flush: true)) {
            render(view: "edit", model: [fechaInstance: fechaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'fecha.label', default: 'Fecha'), fechaInstance.id])
        redirect(action: "show", id: fechaInstance.id)
    }

    def delete(Long id) {
        def fechaInstance = Fecha.get(id)
        if (!fechaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fecha.label', default: 'Fecha'), id])
            redirect(action: "list")
            return
        }

        try {
            fechaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'fecha.label', default: 'Fecha'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fecha.label', default: 'Fecha'), id])
            redirect(action: "show", id: id)
        }
    }
}
