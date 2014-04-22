package qitabapp

import org.springframework.dao.DataIntegrityViolationException

class ReservationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def validerPanier(){
		
		ArrayList<Integer> listLivresAjouteAuPanier = session.getAttribute("panier")
		def livreInstanceList = Livre.getAll(listLivresAjouteAuPanier)
		
		//génération du code
		String codeGenere = "";
		livreInstanceList.each {
			codeGenere = codeGenere + it.titre.hashCode()
		}
		//La date limite pour récupérer le livre
		Date dateLimite = new Date() + 1
		
		//Sauvegarder la résérvation
		def reservation = new Reservation(code : codeGenere, dateReservation : dateLimite)
		livreInstanceList.each {
			reservation.addToLivres(it)
		}
		
		if (!reservation.save(flush: true)) {
			flash.message = message(code: 'Une erreur est survenue, veuillez réessayer')
			redirect(action: "showpanier",controller:"livre")
			return
		}
		
		//On vide le panier
		ArrayList<Integer> listLivresAuPanier = session.getAttribute("panier")
		listLivresAuPanier.clear();
		ArrayList<Integer> listLivresAuPanierTitre = session.getAttribute("titres")
		listLivresAuPanierTitre.clear();
		session.setAttribute("panier", listLivresAuPanier)
		session.setAttribute("nombre", 0)
		session.setAttribute("titres", listLivresAuPanierTitre)
		
		flash.message = message(code: 'reservation reussie')
		
		[livreList: livreInstanceList, reservation : reservation]
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [reservationInstanceList: Reservation.list(params), reservationInstanceTotal: Reservation.count()]
    }

    def save() {
        def reservationInstance = new Reservation(params)
        if (!reservationInstance.save(flush: true)) {
            render(view: "create", model: [reservationInstance: reservationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'reservation.label', default: 'Reservation'), reservationInstance.id])
        redirect(action: "show", id: reservationInstance.id)
    }

    def show(Long id) {
        def reservationInstance = Reservation.get(id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        [reservationInstance: reservationInstance]
    }

}
