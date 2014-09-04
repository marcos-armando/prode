package prode

class Campeonato {
	Integer id
	String nombre
	static hasMany = [fechas:Fecha]
	Integer cantidadPartidos
	
    static constraints = {
		id(blank:false,unique:true)
		nombre(blank:false, maxSize: 50, nullable: false)
		cantidadPartidos(blank:true, nullable: true )
    }
	String toString(){return nombre}
}
