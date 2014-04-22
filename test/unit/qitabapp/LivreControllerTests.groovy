package qitabapp



import org.junit.*
import grails.test.mixin.*

@TestFor(LivreController)
@Mock(Livre)
class LivreControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/livre/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.livreInstanceList.size() == 0
        assert model.livreInstanceTotal == 0
    }

	void testRechercheLivre(){
		
		controller.rechercheLivre()
		
		assert "/livre/rechercheParAuteur" == response.redirectedUrl
		
		
		assert "/livre/rechercheParTitre" == response.redirectedUrl
		
		
		assert "/livre/rechercheParTitre" == response.redirectedUrl
	}
		
    void testRechercheParTitre(){
		
		def model = controller.rechercheParTitre()
		assert model.livreList.size() == 0
	}
	
	def testRechercheParType(){
		
		def model = controller.rechercheParType()
		
		//assert model.cec != null
		//assert model.results != null
		assert model.livreList.size() == 0
	}
	
	def testRechercheParAuteur(){
		def model = controller.rechercheParAuteur()
		
		assert model.livreList.size() ==0
		assert model.livreCount == 0
	}
	
	
		
    void testSave() {
        controller.save()

        assert model.livreInstance != null
        assert view == '/livre/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl != '/livre/show/1'
        assert controller.flash.message == null
        assert Livre.count() == 1
    }

}

    