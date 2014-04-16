import qitabapp.Auteur
import qitabapp.Livre
import qitabapp.TypeDocument;

import org.grails.plugins.csv.CSVMapReader
import org.codehaus.groovy.grails.commons.ApplicationHolder

class BootStrap {

    def init = { servletContext ->
		
		String[] temp = null;
		
		def filePath = "resources/listTitres.csv"
		def appHolder = ApplicationHolder.application.parentContext.getResource("classpath:$filePath")
		appHolder.inputStream.eachCsvLine { tokens ->
			
			temp = tokens[0].split(";");
	
			if(tokens.length > 1 && temp.length == 5){
//				println "Le prenom : "+tokens[1];
//				println "token = "+tokens[0];
//				println "temp = "+temp;
	
				new Livre(titre : temp[3], nombreExemplaires : 20, nbrDisponibles : 10, type : new TypeDocument(intitule : temp[1]))
				.addToAuteurs(new Auteur(nom : temp[4], prenom : tokens[1]))
				.save()
			} else if(tokens.length == 1 && temp.length == 5){
				new Livre(titre : temp[3], nombreExemplaires : 23, nbrDisponibles : 7, type : new TypeDocument(intitule : temp[1]))
				.addToAuteurs(new Auteur(nom : temp[4], prenom : " "))
				.save()
			} else {
				new Livre(titre : temp[3], nombreExemplaires : 13, nbrDisponibles : 4, type : new TypeDocument(intitule : temp[1]))
				.addToAuteurs(new Auteur(nom : " ", prenom : " "))
				.save()
			}
		}
    }
	
    def destroy = {
    }
}