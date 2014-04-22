package qitabapp



import grails.test.GrailsUnitTestCase
import grails.test.mixin.*
import org.junit.*

class LivreTests extends GrailsUnitTestCase{

	Livre livre
	protected void setUp() {
		super.setUp()
		// Make sure we can invoke validate() on our User domain object.
		mockForConstraintsTests(Livre)
		// Set up default user, so we can easily test single properties.
		livre = new Livre(titre: 'le titre', nombreExemplaires: 4, nbrDisponibles: 2)
		}
	void testBlank() {
		livre = new Livre(titre: '', nombreExemplaires: 4, nbrDisponibles: 2)
		assertFalse livre.validate()
		
		livre = new Livre(titre: 'le titre', nombreExemplaires: 4, nbrDisponibles: '')
		assertFalse livre.validate()
		
		livre = new Livre(titre: 'le titre', nombreExemplaires: '', nbrDisponibles: '')
		assertFalse livre.validate()
		
	}
	
}
