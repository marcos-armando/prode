import prode.Campeonato
import prode.Equipo
import prode.Fecha
import prode.Partido
import prode.Role
import prode.User
import prode.UserRole

class BootStrap {

    def init = { servletContext ->
/*	
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
  
		def testUser = new User(username: 'admin', enabled: true, password: '123')
		testUser.save(flush: true)
		def testUser2 = new User(username: 'comun', enabled: true, password: '123')
		testUser2.save(flush: true)
		
		def US = new UserRole(user: testUser, role:adminRole).save(flush: true)
		def US2 = new UserRole(user: testUser2, role:userRole).save(flush: true)
		
		def equipo1 = new Equipo(nombre: "Boca").save(failOnError: true)
		def equipo2 = new Equipo(nombre: "River").save(failOnError: true)
		def equipo3 = new Equipo(nombre: "Racing").save(failOnError: true)
		def equipo4 = new Equipo(nombre: "Independiente").save(failOnError: true)
		def equipo5 = new Equipo(nombre: "San Lorenzo").save(failOnError: true)
		def equipo6 = new Equipo(nombre: "Talleres").save(failOnError: true)
		def equipo7 = new Equipo(nombre: "Belgrano").save(failOnError: true)		
		def equipo8 = new Equipo(nombre: "Instituto").save(failOnError: true)
		def equipo9 = new Equipo(nombre: "Lanus").save(failOnError: true)
		def equipo10 = new Equipo(nombre: "Quilmes").save(failOnError: true)
		def equipo11 = new Equipo(nombre: "Rosario Central").save(failOnError: true)
		def equipo12 = new Equipo(nombre: "Velez").save(failOnError: true)
		def equipo13 = new Equipo(nombre: "Godoy Cruz").save(failOnError: true)
		def equipo14 = new Equipo(nombre: "Union").save(failOnError: true)
		def equipo15 = new Equipo(nombre: "All Boys").save(failOnError: true)
		def equipo16 = new Equipo(nombre: "Gimnasia L.P").save(failOnError: true)
		
		def campeonato1 = new Campeonato(nombre: "Torneo Apertura 2013", ).save(failOnError: true)
		
		def fecha1 = new Fecha(numeroFecha: 1, horaInicio: new Date(), campeonato: campeonato1).save(failOnError: true)
		def fecha2 = new Fecha(numeroFecha: 2, horaInicio: new Date(), campeonato: campeonato1).save(failOnError: true)
		def fecha3 = new Fecha(numeroFecha: 3, horaInicio: new Date(), campeonato: campeonato1).save(failOnError: true)
		def fecha4 = new Fecha(numeroFecha: 4, horaInicio: new Date(), campeonato: campeonato1).save(failOnError: true)
		
		def partido1 = new Partido(nombre: "Boca vs River", equipoLocal: equipo1, equipoVisitante: equipo2, fecha: fecha1).save(failOnError: true)
		def partido2 = new Partido(nombre: "Racing vs Independiente", equipoLocal: equipo3, equipoVisitante: equipo4, fecha: fecha1).save(failOnError: true)
		def partido3 = new Partido(nombre: "San Lorenzo vs Talleres", equipoLocal: equipo5, equipoVisitante: equipo6, fecha: fecha1).save(failOnError: true)
		def partido4 = new Partido(nombre: "Belgrano vs Instituto", equipoLocal: equipo7, equipoVisitante: equipo8, fecha: fecha1).save(failOnError: true)
		def partido5 = new Partido(nombre: "Lanus vs Quilmes", equipoLocal: equipo9, equipoVisitante: equipo10, fecha: fecha1).save(failOnError: true)
		def partido6 = new Partido(nombre: "Rosario Central vs Velez", equipoLocal: equipo11, equipoVisitante: equipo12, fecha: fecha1).save(failOnError: true)
		def partido7 = new Partido(nombre: "Godoy Cruz vs Union", equipoLocal: equipo13, equipoVisitante: equipo14, fecha: fecha1).save(failOnError: true)
		def partido8 = new Partido(nombre: "All Boys vs Gimnasia L.P", equipoLocal: equipo15, equipoVisitante: equipo16, fecha: fecha1).save(failOnError: true)
		
		def partido9 = new Partido(nombre: "Boca vs Racing", equipoLocal: equipo1, equipoVisitante: equipo3, fecha: fecha2).save(failOnError: true)
		def partido10 = new Partido(nombre: "River vs Independiente", equipoLocal: equipo2, equipoVisitante: equipo4, fecha: fecha2).save(failOnError: true)
		def partido11 = new Partido(nombre: "San Lorenzo vs Belgrano", equipoLocal: equipo5, equipoVisitante: equipo7, fecha: fecha2).save(failOnError: true)
		def partido12 = new Partido(nombre: "Talleres vs Instituto", equipoLocal: equipo6, equipoVisitante: equipo8, fecha: fecha2).save(failOnError: true)
		def partido13 = new Partido(nombre: "Lanus vs Rosario Central", equipoLocal: equipo9, equipoVisitante: equipo11, fecha: fecha2).save(failOnError: true)
		def partido14 = new Partido(nombre: "Quilmes vs Velez", equipoLocal: equipo10, equipoVisitante: equipo12, fecha: fecha2).save(failOnError: true)
		def partido15 = new Partido(nombre: "Godoy Cruz vs All Boys", equipoLocal: equipo13, equipoVisitante: equipo15, fecha: fecha2).save(failOnError: true)
		def partido16 = new Partido(nombre: "Union vs Gimnasia L.P", equipoLocal: equipo14, equipoVisitante: equipo16, fecha: fecha2).save(failOnError: true)
*/
				}
    def destroy = {
    }
}
