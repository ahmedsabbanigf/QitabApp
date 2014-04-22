package qitabapp



import grails.test.GrailsUnitTestCase;
import grails.test.mixin.*

import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
class AuteurTests extends GrailsUnitTestCase {

    	Auteur auteur
		
	protected void setUp() {
		super.setUp()
		// Make sure we can invoke validate() on our User domain object.
		mockForConstraintsTests(Auteur)
		// Set up default user, so we can easily test single properties.
		auteur = new Auteur(nom: 'toto', prenom: 'momo')
		}
	
	void testBlank() {
		auteur = new Auteur(nom: 'toto', prenom: 'momo')
		assertTrue auteur.validate()
		
		auteur = new Auteur(nom: '', prenom: 'momo')
		assertFalse auteur.validate()
		
		auteur = new Auteur(nom: 'toto', prenom: '')
		assertFalse auteur.validate()
	}
	
}
