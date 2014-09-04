package prode



import org.junit.*
import grails.test.mixin.*

@TestFor(CampeonatoController)
@Mock(Campeonato)
class CampeonatoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/campeonato/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.campeonatoInstanceList.size() == 0
        assert model.campeonatoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.campeonatoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.campeonatoInstance != null
        assert view == '/campeonato/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/campeonato/show/1'
        assert controller.flash.message != null
        assert Campeonato.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/campeonato/list'

        populateValidParams(params)
        def campeonato = new Campeonato(params)

        assert campeonato.save() != null

        params.id = campeonato.id

        def model = controller.show()

        assert model.campeonatoInstance == campeonato
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/campeonato/list'

        populateValidParams(params)
        def campeonato = new Campeonato(params)

        assert campeonato.save() != null

        params.id = campeonato.id

        def model = controller.edit()

        assert model.campeonatoInstance == campeonato
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/campeonato/list'

        response.reset()

        populateValidParams(params)
        def campeonato = new Campeonato(params)

        assert campeonato.save() != null

        // test invalid parameters in update
        params.id = campeonato.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/campeonato/edit"
        assert model.campeonatoInstance != null

        campeonato.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/campeonato/show/$campeonato.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        campeonato.clearErrors()

        populateValidParams(params)
        params.id = campeonato.id
        params.version = -1
        controller.update()

        assert view == "/campeonato/edit"
        assert model.campeonatoInstance != null
        assert model.campeonatoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/campeonato/list'

        response.reset()

        populateValidParams(params)
        def campeonato = new Campeonato(params)

        assert campeonato.save() != null
        assert Campeonato.count() == 1

        params.id = campeonato.id

        controller.delete()

        assert Campeonato.count() == 0
        assert Campeonato.get(campeonato.id) == null
        assert response.redirectedUrl == '/campeonato/list'
    }
}
