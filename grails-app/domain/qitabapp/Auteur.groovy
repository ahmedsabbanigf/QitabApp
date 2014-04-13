package qitabapp

class Auteur {

	String nom 
	String prenom 
	static hasMany = [livres:Livre]
   
	
	 static constraints = {
		 prenom(blank:false)
		 nom(blank:false)
	 }
    }

