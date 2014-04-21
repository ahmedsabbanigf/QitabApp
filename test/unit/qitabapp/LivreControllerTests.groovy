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
		//assert HttpSession.session == "org.apache.catalina.session.StandardSessionFacade@fa509"
        assert "/livre/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.livreInstanceList.size() == 0
        assert model.livreInstanceTotal == 0
    }

	void testRechercheLivre(){
		
		controller.rechercheLivre()
		
		
		assert response.redirectedUrl == "/livre/rechercheParAuteur"
		
		
		assert response.redirectedUrl == "/livre/rechercheParTitre"
		
		
		assert response.redirectedUrl == "/livre/rechercheParType"
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

        assert response.redirectedUrl == '/livre/show/1'
        assert controller.flash.message != null
        assert Livre.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/livre/list'

        populateValidParams(params)
        def livre = new Livre(params)

        assert livre.save() != null

        params.id = livre.id

        def model = controller.show()

        assert model.livreInstance == livre
    }

}

    