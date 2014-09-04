package prode



import org.junit.*
import grails.test.mixin.*

@TestFor(EstadioController)
@Mock(Estadio)
class EstadioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/estadio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.estadioInstanceList.size() == 0
        assert model.estadioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.estadioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.estadioInstance != null
        assert view == '/estadio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/estadio/show/1'
        assert controller.flash.message != null
        assert Estadio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/estadio/list'

        populateValidParams(params)
        def estadio = new Estadio(params)

        assert estadio.save() != null

        params.id = estadio.id

        def model = controller.show()

        assert model.estadioInstance == estadio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/estadio/list'

        populateValidParams(params)
        def estadio = new Estadio(params)

        assert estadio.save() != null

        params.id = estadio.id

        def model = controller.edit()

        assert model.estadioInstance == estadio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/estadio/list'

        response.reset()

        populateValidParams(params)
        def estadio = new Estadio(params)

        assert estadio.save() != null

        // test invalid parameters in update
        params.id = estadio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/estadio/edit"
        assert model.estadioInstance != null

        estadio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/estadio/show/$estadio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        estadio.clearErrors()

        populateValidParams(params)
        params.id = estadio.id
        params.version = -1
        controller.update()

        assert view == "/estadio/edit"
        assert model.estadioInstance != null
        assert model.estadioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/estadio/list'

        response.reset()

        populateValidParams(params)
        def estadio = new Estadio(params)

        assert estadio.save() != null
        assert Estadio.count() == 1

        params.id = estadio.id

        controller.delete()

        assert Estadio.count() == 0
        assert Estadio.get(estadio.id) == null
        assert response.redirectedUrl == '/estadio/list'
    }
}
