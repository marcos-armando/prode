package prode

class Partido {
	Integer id
	String nombre
	Equipo equipoLocal
	Equipo equipoVisitante
	Integer golesEquipoLocal
	Integer golesEquipoVisitante
	Estadio estadio
	static belongsTo = [fecha:Fecha]
	//Integer numeroFecha
	
    static constraints = {
		id(blank:false,unique:true)
		nombre(blank:false, nullable: false)
		equipoLocal(blank:false, nullable: false)
		equipoVisitante(blank:false, nullable: false)
		golesEquipoLocal(blank:true, nullable: true)
		golesEquipoVisitante(blank:true, nullable: true)
		estadio(blank:true, nullable: true)
		
    }
	String toString(){return nombre}
}
