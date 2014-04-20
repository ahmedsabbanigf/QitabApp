package qitabapp

import javax.servlet.http.HttpSession
import org.springframework.dao.DataIntegrityViolationException

class LivreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	static ArrayList<Integer> listPanier = new ArrayList<Integer>()
	
    def index() {
		println "entree index"
		HttpSession session=request.getSession();
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [livreInstanceList: Livre.list(params), livreInstanceTotal: Livre.count()]
    }
	
	def showpanier() {
		//println session.panier
		ArrayList<Integer> listLivresAjouteAuPanier = session.getAttribute("panier") 
		[livreInstanceList: Livre.getAll(listLivresAjouteAuPanier), livreInstanceTotal: Livre.count()]
	}

	def rechercheLivre(){
		println params
		println params.myGroup
		
		if(params.myGroup.equals("2")){
			redirect(action: "rechercheParAuteur", params: params)
		}
		else if(params.myGroup.equals("1")){
			
			redirect(action: "rechercheParTitre", params: params)
		}
		else{
			redirect(action: "rechercheParType", params: params)
		}
		
		}
	
	def rechercheParType(){
		
		def c = Livre.createCriteria()
		def results = c.list {

				type{
					like("intitule" , "%"+params.titre+"%")
				}
			}

		[livreList: results]
	}
	
	def rechercheParAuteur(){
	def c = Livre.createCriteria()
		def result = c.list {

				auteurs{
					like("prenom" , "%"+params.titre+"%")
					
						}
			}
			
		println  result
		[livreList: result]
	}
	
	def rechercheParTitre(){
		
		def myList=Livre.findAllByTitreLike("%"+params.titre+"%")
		
		println myList
		
		// place dans une Map cette liste avec la cle livreList
		[livreList: myList]
	}

    def create() {
		println params
        [livreInstance: new Livre(params)]
    }

    def save() {
        def livreInstance = new Livre(params)
        if (!livreInstance.save(flush: true)) {
            render(view: "create", model: [livreInstance: livreInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'livre.label', default: 'Livre'), livreInstance.id])
        redirect(action: "show", id: livreInstance.id)
    }

    def show(Long id) {
        def livreInstance = Livre.get(id)
        if (!livreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'livre.label', default: 'Livre'), id])
            redirect(action: "list")
            return
        }

        [livreInstance: livreInstance]
    }

    def edit(Long id) {
        def livreInstance = Livre.get(id)
        if (!livreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'livre.label', default: 'Livre'), id])
            redirect(action: "list")
            return
        }

        [livreInstance: livreInstance]
    }

    def update(Long id, Long version) {
        def livreInstance = Livre.get(id)
        if (!livreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'livre.label', default: 'Livre'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (livreInstance.version > version) {
                livreInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'livre.label', default: 'Livre')] as Object[],
                          "Another user has updated this Livre while you were editing")
                render(view: "edit", model: [livreInstance: livreInstance])
                return
            }
        }

        livreInstance.properties = params

        if (!livreInstance.save(flush: true)) {
            render(view: "edit", model: [livreInstance: livreInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'livre.label', default: 'Livre'), livreInstance.id])
        redirect(action: "show", id: livreInstance.id)
    }

    def delete(Long id) {
        def livreInstance = Livre.get(id)
        if (!livreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'livre.label', default: 'Livre'), id])
            redirect(action: "list")
            return
        }

        try {
            livreInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'livre.label', default: 'Livre'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'livre.label', default: 'Livre'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def ajoutpanier(Long id) {
		def livreInstance = Livre.get(id)
		if (!livreInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'livre.label', default: 'Livre'), id])
			redirect(action: "list")
			return
		}
		
		
		if(livreInstance.nbrDisponibles >= 1){
			livreInstance.nbrDisponibles = livreInstance.nbrDisponibles-1 
			if (!livreInstance.save(flush: true)) {
				render(view: "list", model: [livreInstance: livreInstance])
				return
			}
			
			listPanier.add(livreInstance.id)
			session["panier"] = listPanier
			println session.panier
			
			
			flash.message = message(code: 'Livre ajouté au panier avec succés', args: [message(code: 'livre.label', default: 'Livre'), livreInstance.id])
			redirect(action: "list")
		}else {
		flash.message = message(code: 'Le livre est indisponible', args: [message(code: 'livre.label', default: 'Livre'), id])
		redirect(action: "list")
		}

	}
	
	def viderpanier() {
		ArrayList<Integer> listLivresAjouteAuPanier = session.getAttribute("panier")
		def livreInstanceList = Livre.getAll(listLivresAjouteAuPanier)
		println "livre au panier : "+livreInstanceList
		livreInstanceList.each {
			it.nbrDisponibles = it.nbrDisponibles + 1;
			it.save(flush:true)
		}
		listLivresAjouteAuPanier.clear();
		session.setAttribute("panier", listLivresAjouteAuPanier)
		flash.message = message(code: 'Le panier est désormais vide', args: [message(code: 'livre.label', default: 'Livre')])
		redirect(uri: request.getHeader('referer') )	
		}
}
