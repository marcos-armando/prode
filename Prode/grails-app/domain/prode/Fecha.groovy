package prode

import java.text.SimpleDateFormat
import java.util.Formatter.DateTime

class Fecha {
	Integer id
	Integer numeroFecha
	Date horaInicio = new Date()
	static hasMany = [partidos:Partido]
	static belongsTo = [campeonato:Campeonato]
	
	    static constraints = {
			id(blank:false,unique:true)
		}
		String toString(){return numeroFecha}
    }