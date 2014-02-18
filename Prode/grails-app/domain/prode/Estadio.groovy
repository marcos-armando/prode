package prode

class Estadio {
	Integer id
	String nombre
	Equipo equipo
	
    static constraints = {
		id(blank:false,unique:true)
		nombre(blank:false, maxSize: 50, nullable: false)
		equipo(blank:true, nullable: true )
    }
	String toString(){return nombre}
}
