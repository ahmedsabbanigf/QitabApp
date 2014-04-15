package qitabapp

class Auteur {

	String nom 
	String prenom 
	static hasMany = [livres:Livre]
	static belongsTo = Livre
	
	def String toString() {
		nom
	}
	
	 static constraints = {
		 prenom(blank:false)
		 nom(blank:false)
	 }
    }

