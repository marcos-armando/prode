package prode

class Equipo {
	Integer id
	String nombre
	String apodo
    static constraints = {
		id(blank:false,unique:true)
		nombre(blank:false, maxSize: 50, nullable: false)
		apodo(blank:true,  maxSize: 50, nullable: true )
    }
	String toString(){return nombre}
}
