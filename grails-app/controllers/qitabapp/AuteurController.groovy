package qitabapp

import org.springframework.dao.DataIntegrityViolationException

class AuteurController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		println session.panier
        [auteurInstanceList: Auteur.list(params), auteurInstanceTotal: Auteur.count()]
    }

    def save() {
        def auteurInstance = new Auteur(params)
        if (!auteurInstance.save(flush: true)) {
            render(view: "create", model: [auteurInstance: auteurInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'auteur.label', default: 'Auteur'), auteurInstance.id])
        redirect(action: "show", id: auteurInstance.id)
    }

    def show(Long id) {
        def auteurInstance = Auteur.get(id)
        if (!auteurInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'auteur.label', default: 'Auteur'), id])
            redirect(action: "list")
            return
        }

        [auteurInstance: auteurInstance]
    }
}
