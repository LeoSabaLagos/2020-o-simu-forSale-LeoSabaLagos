class Empleado {
	
	var operacionesCerradas = []
	var inmueblesReservados = []
	
	method operacionesCerradas() = operacionesCerradas
	
	method inmueblesReservados() = inmueblesReservados
	
	method cerrarOperacion(unaOperacion){ operacionesCerradas.add(unaOperacion) }
	
	method reservarInmueble(unInmueble){ inmueblesReservados.add(unInmueble) } 
	
	method totalComisionesOperacionesConcretadas() = 
		operacionesCerradas.map{operacion => operacion.comision()}.sum()
		
	method cantidadOperacionesCerradas() = operacionesCerradas.size()
	
	method cantidadReservas() = inmueblesReservados.size()
	
	// Se pide también saber si un empleado va a tener problemas con otro
	method tieneProblemasConOtroEmpleado(otroEmpleado) = 
		self.cerraronOperacionesEnLaMismaZona(otroEmpleado)
		&& 
		self.algunoLeConcretoUnInmuebleReservadoPorElOtro(otroEmpleado)
		
	method cerraronOperacionesEnLaMismaZona(otroEmpleado) = 
		not(self.operacionesCerradas().map{operacion => operacion.inmueble().zona()}.intersecion(otroEmpleado.inmueblesReservados().map{inmueble=> inmueble.zona()}).isEmpty())
		or
		not(otroEmpleado.operacionesCerradas().map{operacion => operacion.inmueble().zona()}.intersecion(self.inmueblesReservados().map{inmueble=> inmueble.zona()}).isEmpty()) 
		
	method algunoLeConcretoUnInmuebleReservadoPorElOtro(otroEmpleado) = 
		not(self.operacionesCerradas().map{operacion => operacion.inmueble()}.intersecion(otroEmpleado.inmueblesReservados()).isEmpty()) 
		or
		not(otroEmpleado.operacionesCerradas().map{operacion => operacion.inmueble()}.intersecion(self.inmueblesReservados()).isEmpty()) 
}