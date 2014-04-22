import qitabapp.Auteur
import qitabapp.Livre
import qitabapp.TypeDocument;

import javax.servlet.http.HttpSession
import org.grails.plugins.csv.CSVMapReader
import org.codehaus.groovy.grails.commons.ApplicationHolder

class BootStrap {

    def init = { servletContext ->
		
		/*String[] temp = null;

		def i = 0
		def filePath = "resources/listTitres.csv"
		def appHolder = ApplicationHolder.application.parentContext.getResource("classpath:$filePath")
		ArrayList<Auteur> listAuteurs = new ArrayList<Auteur>();
		ArrayList<TypeDocument> listTypes = new ArrayList<TypeDocument>();
		
		appHolder.inputStream.eachCsvLine { tokens ->
			//Pour ne pas stocker la toute premiere ligne (lentete)
			if(i != 0) {
			temp = tokens[0].split(";");
			println temp;
			
			//Le cas o� l'auteur a un nom et un prenom
			if(tokens.length > 1 && temp.length == 5){
		
				def auteur1 = new Auteur(nom:temp[4], prenom:tokens[1])
				if(!listAuteurs.contains(auteur1)){
					auteur1.save()
					listAuteurs.add(auteur1)
				}
				def type1 = new TypeDocument(intitule : temp[1])
				if(!listTypes.contains(type1)){
					type1.save()
					listTypes.add(type1)
				}
				def livre = new Livre(titre:temp[3], nombreExemplaires:20, nbrDisponibles:10,type : type1).addToAuteurs(auteur1)
				livre.save()
				
			//Le cas o� l'auteur a un nom
			} else if(tokens.length == 1 && temp.length == 5){
			def auteur1 = new Auteur(nom:temp[4], prenom:"~")
			if(!listAuteurs.contains(auteur1)){
				auteur1.save()
				listAuteurs.add(auteur1)
			}
			def type1 = new TypeDocument(intitule : temp[1])
			if(!listTypes.contains(type1)){
				type1.save()
				listTypes.add(type1)
			}
			def livre = new Livre(titre:temp[3], nombreExemplaires:15, nbrDisponibles:10,type : type1).addToAuteurs(auteur1)
			livre.save()
			
			//Le cas o� l'auteur n'a pas de nom ni de prenom
			} else {
			def auteur1 = new Auteur(nom:"~", prenom:"~")
			if(!listAuteurs.contains(auteur1)){
				auteur1.save()
				listAuteurs.add(auteur1)
			}
			def type1 = new TypeDocument(intitule : temp[1])
			if(!listTypes.contains(type1)){
				type1.save()
				listTypes.add(type1)
			}
			def livre = new Livre(titre:temp[3], nombreExemplaires:18, nbrDisponibles:13,type : type1).addToAuteurs(auteur1)
			livre.save()
			}
		}
			i = i + 1
	}*/
		 
   }
	
    def destroy = {
    }
}