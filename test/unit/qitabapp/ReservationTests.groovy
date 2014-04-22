package qitabapp



import grails.test.GrailsUnitTestCase;
import grails.test.mixin.*

import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
class ReservationTests extends GrailsUnitTestCase {
	Reservation reservation
	
		protected void setUp() {
			super.setUp()
			// Make sure we can invoke validate() on our User domain object.
			mockForConstraintsTests(Reservation)
			// Set up default user, so we can easily test single properties.
			reservation = new Reservation(code: 'toto', dateReservation: new Date())
			}
		
		void testBlank() {
			reservation = new Reservation(code: 'toto', dateReservation: new Date())
			assertTrue reservation.validate()
			
			reservation = new Reservation(code: '', dateReservation: new Date())
			assertFalse reservation.validate()
			
			reservation = new Reservation(code: 'toto', dateReservation: '')
			assertFalse reservation.validate()
		}
		
		void testUnique() {
			// Test user to test uniqueness of nickName property.
			def test = new Reservation(code: 't2ot12o', dateReservation: new Date())
			mockForConstraintsTests(Reservation, [test])
			assertTrue reservation.validate()
			
			reservation = new Reservation(code: 't2ot12o', dateReservation: new Date())
			assertFalse reservation.validate()
		}
    
}
