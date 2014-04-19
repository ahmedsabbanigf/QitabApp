import qitabapp.Auteur
import qitabapp.Livre
import qitabapp.TypeDocument;

import org.grails.plugins.csv.CSVMapReader
import org.codehaus.groovy.grails.commons.ApplicationHolder

class BootStrap {

    def init = { servletContext ->
		
		String[] temp = null;
		def livre
		def i = 0
		def filePath = "resources/listTitres.csv"
		def appHolder = ApplicationHolder.application.parentContext.getResource("classpath:$filePath")
		
		appHolder.inputStream.eachCsvLine { tokens ->
			if(i != 0) {
			temp = tokens[0].split(";");
			println temp;
			if(tokens.length > 1 && temp.length == 5){
				def auteur1 = new Auteur(nom:temp[4], prenom:tokens[1])
				def type1 = new TypeDocument(intitule : temp[1]).save()
				livre = new Livre(titre:temp[3], nombreExemplaires:20, nbrDisponibles:10,type : type1).addToAuteurs(auteur1).save()
			} else if(tokens.length == 1 && temp.length == 5){
			def auteur1 = new Auteur(nom:temp[4], prenom:" ")
			def type1 = new TypeDocument(intitule : temp[1]).save()
			livre = new Livre(titre:temp[3], nombreExemplaires:15, nbrDisponibles:10,type : type1).addToAuteurs(auteur1).save()
			} else {
			def auteur1 = new Auteur(nom:" ", prenom:" ")
			def type1 = new TypeDocument(intitule : temp[1]).save()
			livre = new Livre(titre:temp[3], nombreExemplaires:18, nbrDisponibles:13,type : type1).addToAuteurs(auteur1).save()
			}
		}
			i = i + 1
	}
   }
	
    def destroy = {
    }
}