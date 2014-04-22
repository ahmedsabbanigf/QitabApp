package qitabapp

import org.springframework.dao.DataIntegrityViolationException

class TypeDocumentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [typeDocumentInstanceList: TypeDocument.list(params), typeDocumentInstanceTotal: TypeDocument.count()]
    }

    def save() {
        def typeDocumentInstance = new TypeDocument(params)
        if (!typeDocumentInstance.save(flush: true)) {
            render(view: "create", model: [typeDocumentInstance: typeDocumentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'typeDocument.label', default: 'TypeDocument'), typeDocumentInstance.id])
        redirect(action: "show", id: typeDocumentInstance.id)
    }

    def show(Long id) {
        def typeDocumentInstance = TypeDocument.get(id)
        if (!typeDocumentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeDocument.label', default: 'TypeDocument'), id])
            redirect(action: "list")
            return
        }

        [typeDocumentInstance: typeDocumentInstance]
    }

}
