package qitabapp



import org.junit.*
import grails.test.mixin.*

@TestFor(AuteurController)
@Mock(Auteur)
class AuteurControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/auteur/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.auteurInstanceList.size() == 0
        assert model.auteurInstanceTotal == 0
    }

    void testSave() {
        controller.save()

        assert model.auteurInstance != null
        assert view == '/auteur/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/auteur/show/1'
        assert controller.flash.message != null
        assert Auteur.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/auteur/list'

        populateValidParams(params)
        def auteur = new Auteur(params)

        assert auteur.save() != null

        params.id = auteur.id

        def model = controller.show()

        assert model.auteurInstance == auteur
    }
}
