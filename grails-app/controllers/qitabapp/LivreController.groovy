package qitabapp

import javax.servlet.http.HttpSession
import org.springframework.dao.DataIntegrityViolationException

class LivreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	static ArrayList<Integer> listPanier = new ArrayList<Integer>()
	static ArrayList<String> listPanierTitre = new ArrayList<String>()
	
    def index() {
		HttpSession session=request.getSession();
		session["nombre"] = 0
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        //params.max = Math.min(max ?: 10, 100)
        [livreInstanceList: Livre.list(params), livreInstanceTotal: Livre.count()]
    }
	
	def showpanier() {
		//println session.panier
		ArrayList<Integer> listLivresAjouteAuPanier = session.getAttribute("panier") 
		println listLivresAjouteAuPanier
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
	println params
	def c = Livre.createCriteria()
		def result = c.list {
			auteurs {
				or {
					ilike("prenom" , "%"+params.titre+"%")
					ilike("nom" , "%"+params.titre+"%")
				}
			}
		}
		
		[livreList: result, livreCount:result.size()]
	//	redirect(uri: request.getHeader('referer') )
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
			//redirect(action: "list")
			redirect(uri: request.getHeader('referer') )
			return
		}
		
		println " listPanier "+ listPanier
		if(livreInstance.nbrDisponibles >= 1 && !listPanier.contains(id)){
			livreInstance.nbrDisponibles = livreInstance.nbrDisponibles-1 
			if (!livreInstance.save(flush: true)) {
				//render(view: "list", model: [livreInstance: livreInstance])
				redirect(uri: request.getHeader('referer') )
				return
			}
			
			listPanier.add(livreInstance.id)
			listPanierTitre.add(livreInstance.titre)
			session["panier"] = listPanier
			session["nombre"] = listPanier.size()
			session["titres"] =  listPanierTitre
			
			flash.message = message(code: 'Livre ajoute au panier avec succes', args: [message(code: 'livre.label', default: 'Livre'), livreInstance.id])
			//redirect(action: "list")
			redirect(uri: request.getHeader('referer') )
		}else {
		flash.message = message(code: 'Le livre est indisponible', args: [message(code: 'livre.label', default: 'Livre'), id])
		//redirect(action: "list")
		redirect(uri: request.getHeader('referer') )
		}

	}
	
	def supprimerLivreDuPanier(Long id){
		ArrayList<Integer> listLivresAjouteAuPanier = session.getAttribute("panier")
		ArrayList<String> listTitresLivres = session.getAttribute("titres")
		
		//listPanier.addt(livreInstance.id)
		def livreInstanceList = Livre.get(id)
		livreInstanceList.each {
			it.nbrDisponibles = it.nbrDisponibles + 1
			it.save(flush:true)
		}
		
		listLivresAjouteAuPanier.remove((Integer)id)
		listPanier.remove((Integer)id)
		listTitresLivres.remove(livreInstanceList.titre)
		listPanierTitre.remove(livreInstanceList.titre)
		
		session.setAttribute("panier", listLivresAjouteAuPanier)
		session.setAttribute("nombre", session.getAttribute("nombre") - 1)
		session.setAttribute("titres", listTitresLivres)
		redirect(action: "showpanier")
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
		session.setAttribute("nombre", 0)
		session.setAttribute("titres", listLivresAjouteAuPanier)
		
		flash.message = message(code: 'Le panier est desormais vide', args: [message(code: 'livre.label', default: 'Livre')])
		redirect(uri: request.getHeader('referer') )	
		}
}