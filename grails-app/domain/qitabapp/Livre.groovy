package qitabapp

class Livre {

	String titre
	int nombreExemplaires
	int nbrDisponibles
	TypeDocument type
	
	static hasMany = [reservations : Reservation, auteurs : Auteur]

	def String toString() {
		titre
	}
	
	static constraints = {
		titre(blank:false)
		nombreExemplaires(blank:false)
		nbrDisponibles(blank:false)
    }
}
