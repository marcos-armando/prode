package prode

class Resultado {
	Integer id
	String nombre
	
    static constraints = {
		//resultado inList: ["Local", "Visitante", "Empate"]
		id(blank:false,unique:true)
		nombre(blank:false, nullable: false)
    }
}
