package qitabapp

class Livre {

	String titre
	String nombreExemplaires
	String nbrDisponibles
	TypeDocument type
	
	static hasMany = [reservations : Reservation, auteurs : Auteur]
	static belongsTo = Auteur
	
	static constraints = {
		titre(blank:false)
		nombreExemplaires(blank:false)
		nbrDisponibles(blank:false)
    }
}
