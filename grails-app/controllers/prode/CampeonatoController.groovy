package prode

import org.springframework.dao.DataIntegrityViolationException

class CampeonatoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [campeonatoInstanceList: Campeonato.list(params), campeonatoInstanceTotal: Campeonato.count()]
    }

    def create() {
        [campeonatoInstance: new Campeonato(params)]
    }

    def save() {
        def campeonatoInstance = new Campeonato(params)
        if (!campeonatoInstance.save(flush: true)) {
            render(view: "create", model: [campeonatoInstance: campeonatoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'campeonato.label', default: 'Campeonato'), campeonatoInstance.id])
        redirect(action: "show", id: campeonatoInstance.id)
    }

    def show(Long id) {
        def campeonatoInstance = Campeonato.get(id)
        if (!campeonatoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campeonato.label', default: 'Campeonato'), id])
            redirect(action: "list")
            return
        }

        [campeonatoInstance: campeonatoInstance]
    }

    def edit(Long id) {
        def campeonatoInstance = Campeonato.get(id)
        if (!campeonatoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campeonato.label', default: 'Campeonato'), id])
            redirect(action: "list")
            return
        }

        [campeonatoInstance: campeonatoInstance]
    }

    def update(Long id, Long version) {
        def campeonatoInstance = Campeonato.get(id)
        if (!campeonatoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campeonato.label', default: 'Campeonato'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (campeonatoInstance.version > version) {
                campeonatoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'campeonato.label', default: 'Campeonato')] as Object[],
                          "Another user has updated this Campeonato while you were editing")
                render(view: "edit", model: [campeonatoInstance: campeonatoInstance])
                return
            }
        }

        campeonatoInstance.properties = params

        if (!campeonatoInstance.save(flush: true)) {
            render(view: "edit", model: [campeonatoInstance: campeonatoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'campeonato.label', default: 'Campeonato'), campeonatoInstance.id])
        redirect(action: "show", id: campeonatoInstance.id)
    }

    def delete(Long id) {
        def campeonatoInstance = Campeonato.get(id)
        if (!campeonatoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campeonato.label', default: 'Campeonato'), id])
            redirect(action: "list")
            return
        }

        try {
            campeonatoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'campeonato.label', default: 'Campeonato'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'campeonato.label', default: 'Campeonato'), id])
            redirect(action: "show", id: id)
        }
    }
}
