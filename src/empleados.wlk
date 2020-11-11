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
		self.operacionesCerradas().map{operacion => operacion.inmueble().zona()}.intersecion(otroEmpleado.inmueblesReservados().map{inmueble=> inmueble.zona()})
		or
		otroEmpleado.operacionesCerradas().map{operacion => operacion.inmueble().zona()}.intersecion(self.inmueblesReservados().map{inmueble=> inmueble.zona()})
		
	method algunoLeConcretoUnInmuebleReservadoPorElOtro(otroEmpleado) = 
		self.operacionesCerradas().map{operacion => operacion.inmueble()}.intersecion(otroEmpleado.inmueblesReservados())
		or
		otroEmpleado.operacionesCerradas().map{operacion => operacion.inmueble()}.intersecion(self.inmueblesReservados())
}