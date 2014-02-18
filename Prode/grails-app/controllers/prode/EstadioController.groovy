package prode

import org.springframework.dao.DataIntegrityViolationException

class EstadioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def estadios = Estadio.list(params)
        [estadioInstanceList: Estadio.list(params), estadioInstanceTotal: Estadio.count()]
    }

    def create() {
        [estadioInstance: new Estadio(params)]
    }

    def save() {
        def estadioInstance = new Estadio(params)
        if (!estadioInstance.save(flush: true)) {
            render(view: "create", model: [estadioInstance: estadioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'estadio.label', default: 'Estadio'), estadioInstance.id])
        redirect(action: "show", id: estadioInstance.id)
    }

    def show(Long id) {
        def estadioInstance = Estadio.get(id)
        if (!estadioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadio.label', default: 'Estadio'), id])
            redirect(action: "list")
            return
        }

        [estadioInstance: estadioInstance]
    }

    def edit(Long id) {
        def estadioInstance = Estadio.get(id)
        if (!estadioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadio.label', default: 'Estadio'), id])
            redirect(action: "list")
            return
        }

        [estadioInstance: estadioInstance]
    }

    def update(Long id, Long version) {
        def estadioInstance = Estadio.get(id)
        if (!estadioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadio.label', default: 'Estadio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (estadioInstance.version > version) {
                estadioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'estadio.label', default: 'Estadio')] as Object[],
                          "Another user has updated this Estadio while you were editing")
                render(view: "edit", model: [estadioInstance: estadioInstance])
                return
            }
        }

        estadioInstance.properties = params

        if (!estadioInstance.save(flush: true)) {
            render(view: "edit", model: [estadioInstance: estadioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'estadio.label', default: 'Estadio'), estadioInstance.id])
        redirect(action: "show", id: estadioInstance.id)
    }

    def delete(Long id) {
        def estadioInstance = Estadio.get(id)
        if (!estadioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadio.label', default: 'Estadio'), id])
            redirect(action: "list")
            return
        }

        try {
            estadioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'estadio.label', default: 'Estadio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'estadio.label', default: 'Estadio'), id])
            redirect(action: "show", id: id)
        }
    }
}
