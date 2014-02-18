package prode



import org.junit.*
import grails.test.mixin.*

@TestFor(EquipoController)
@Mock(Equipo)
class EquipoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/equipo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.equipoInstanceList.size() == 0
        assert model.equipoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.equipoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.equipoInstance != null
        assert view == '/equipo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/equipo/show/1'
        assert controller.flash.message != null
        assert Equipo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/equipo/list'

        populateValidParams(params)
        def equipo = new Equipo(params)

        assert equipo.save() != null

        params.id = equipo.id

        def model = controller.show()

        assert model.equipoInstance == equipo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/equipo/list'

        populateValidParams(params)
        def equipo = new Equipo(params)

        assert equipo.save() != null

        params.id = equipo.id

        def model = controller.edit()

        assert model.equipoInstance == equipo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/equipo/list'

        response.reset()

        populateValidParams(params)
        def equipo = new Equipo(params)

        assert equipo.save() != null

        // test invalid parameters in update
        params.id = equipo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/equipo/edit"
        assert model.equipoInstance != null

        equipo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/equipo/show/$equipo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        equipo.clearErrors()

        populateValidParams(params)
        params.id = equipo.id
        params.version = -1
        controller.update()

        assert view == "/equipo/edit"
        assert model.equipoInstance != null
        assert model.equipoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/equipo/list'

        response.reset()

        populateValidParams(params)
        def equipo = new Equipo(params)

        assert equipo.save() != null
        assert Equipo.count() == 1

        params.id = equipo.id

        controller.delete()

        assert Equipo.count() == 0
        assert Equipo.get(equipo.id) == null
        assert response.redirectedUrl == '/equipo/list'
    }
}
