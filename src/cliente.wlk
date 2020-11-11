import empleados.*
import inmuebles.*

class Cliente {
	
	method reservarPropiedad(unEmpleado,unInmueble){
		unEmpleado.reservarInmueble(unInmueble)
		unInmueble.reservarse(self)
	} 
	
	method concretarOperacionPublicada(unEmpleado,unInmueble){
		
		if(unInmueble.estaReservado()){
			if(unInmueble.noEstaReservadoPor(self))
				self.error("Otro cliente ya habia reservado este inmueble")
		}
		else unEmpleado.cerrarOperacion(unInmueble.operacionPublicada())
	}	
}
