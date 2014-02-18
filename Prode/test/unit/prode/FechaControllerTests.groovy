package prode



import org.junit.*
import grails.test.mixin.*

@TestFor(FechaController)
@Mock(Fecha)
class FechaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fecha/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fechaInstanceList.size() == 0
        assert model.fechaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.fechaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fechaInstance != null
        assert view == '/fecha/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fecha/show/1'
        assert controller.flash.message != null
        assert Fecha.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fecha/list'

        populateValidParams(params)
        def fecha = new Fecha(params)

        assert fecha.save() != null

        params.id = fecha.id

        def model = controller.show()

        assert model.fechaInstance == fecha
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fecha/list'

        populateValidParams(params)
        def fecha = new Fecha(params)

        assert fecha.save() != null

        params.id = fecha.id

        def model = controller.edit()

        assert model.fechaInstance == fecha
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fecha/list'

        response.reset()

        populateValidParams(params)
        def fecha = new Fecha(params)

        assert fecha.save() != null

        // test invalid parameters in update
        params.id = fecha.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fecha/edit"
        assert model.fechaInstance != null

        fecha.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fecha/show/$fecha.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fecha.clearErrors()

        populateValidParams(params)
        params.id = fecha.id
        params.version = -1
        controller.update()

        assert view == "/fecha/edit"
        assert model.fechaInstance != null
        assert model.fechaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fecha/list'

        response.reset()

        populateValidParams(params)
        def fecha = new Fecha(params)

        assert fecha.save() != null
        assert Fecha.count() == 1

        params.id = fecha.id

        controller.delete()

        assert Fecha.count() == 0
        assert Fecha.get(fecha.id) == null
        assert response.redirectedUrl == '/fecha/list'
    }
}
