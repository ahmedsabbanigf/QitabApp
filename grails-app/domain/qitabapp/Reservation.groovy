package qitabapp

class Reservation {

	def code
	def dateReservation
	
	static belongsTo = Livre
	static hasMany = [livres:Livre]
    
	
	static constraints = {
    }
}
