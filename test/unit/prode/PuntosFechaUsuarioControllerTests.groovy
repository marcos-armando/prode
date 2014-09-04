package prode



import org.junit.*
import grails.test.mixin.*

@TestFor(PuntosFechaUsuarioController)
@Mock(PuntosFechaUsuario)
class PuntosFechaUsuarioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/puntosFechaUsuario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.puntosFechaUsuarioInstanceList.size() == 0
        assert model.puntosFechaUsuarioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.puntosFechaUsuarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.puntosFechaUsuarioInstance != null
        assert view == '/puntosFechaUsuario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/puntosFechaUsuario/show/1'
        assert controller.flash.message != null
        assert PuntosFechaUsuario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/puntosFechaUsuario/list'

        populateValidParams(params)
        def puntosFechaUsuario = new PuntosFechaUsuario(params)

        assert puntosFechaUsuario.save() != null

        params.id = puntosFechaUsuario.id

        def model = controller.show()

        assert model.puntosFechaUsuarioInstance == puntosFechaUsuario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/puntosFechaUsuario/list'

        populateValidParams(params)
        def puntosFechaUsuario = new PuntosFechaUsuario(params)

        assert puntosFechaUsuario.save() != null

        params.id = puntosFechaUsuario.id

        def model = controller.edit()

        assert model.puntosFechaUsuarioInstance == puntosFechaUsuario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/puntosFechaUsuario/list'

        response.reset()

        populateValidParams(params)
        def puntosFechaUsuario = new PuntosFechaUsuario(params)

        assert puntosFechaUsuario.save() != null

        // test invalid parameters in update
        params.id = puntosFechaUsuario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/puntosFechaUsuario/edit"
        assert model.puntosFechaUsuarioInstance != null

        puntosFechaUsuario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/puntosFechaUsuario/show/$puntosFechaUsuario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        puntosFechaUsuario.clearErrors()

        populateValidParams(params)
        params.id = puntosFechaUsuario.id
        params.version = -1
        controller.update()

        assert view == "/puntosFechaUsuario/edit"
        assert model.puntosFechaUsuarioInstance != null
        assert model.puntosFechaUsuarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/puntosFechaUsuario/list'

        response.reset()

        populateValidParams(params)
        def puntosFechaUsuario = new PuntosFechaUsuario(params)

        assert puntosFechaUsuario.save() != null
        assert PuntosFechaUsuario.count() == 1

        params.id = puntosFechaUsuario.id

        controller.delete()

        assert PuntosFechaUsuario.count() == 0
        assert PuntosFechaUsuario.get(puntosFechaUsuario.id) == null
        assert response.redirectedUrl == '/puntosFechaUsuario/list'
    }
}
