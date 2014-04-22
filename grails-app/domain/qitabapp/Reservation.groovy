package qitabapp

class Reservation {

	String code
	Date dateReservation
	
	static belongsTo = Livre
	static hasMany = [livres:Livre]
    
	static mapping = {
		livres fetch:"join"
		}
	
	static constraints = {
		code(blank:false)
		dateReservation (blank:false)
    }
}
