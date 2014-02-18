package prode

class Apuesta {
	User usuario
	Partido partido
	String resultadoApostado
    static constraints = {
		id composite:['usuario', 'partido']
		resultadoApostado inList: ["Local", "Visitante", "Empate"]
    }
	
}
