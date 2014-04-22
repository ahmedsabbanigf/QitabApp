package qitabapp

class Reservation {

	String code
	Date dateReservation
	
	static belongsTo = Livre
	static hasMany = [livres:Livre]
    
	
	static constraints = {
		code(blank:false, unique : true)
		dateReservation (blank:false)
    }
}
