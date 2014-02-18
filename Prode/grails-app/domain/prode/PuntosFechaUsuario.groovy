package prode

class PuntosFechaUsuario {
	User usuario
	Fecha fecha
	Integer puntos
	
    static constraints = {
		id composite:['usuario', 'fecha']
		puntos(blank:false, nullable: false )
    }
}
