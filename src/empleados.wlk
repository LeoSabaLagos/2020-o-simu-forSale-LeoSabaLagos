class Empleado {
	
	var operacionesCerradas = []
	var inmueblesReservados = []
	
	method cerrarOperacion(unaOperacion){ operacionesCerradas.add(unaOperacion) }
	
	method reservarInmueble(unInmueble){ inmueblesReservados.add(unInmueble) } 
	
	method totalComisionesOperacionesConcretadas() = 
		operacionesCerradas.map{operacion => operacion.comision()}.sum()
		
	method cantidadOperacionesCerradas() = operacionesCerradas.size()
	
	method cantidadReservas() = inmueblesReservados.size()	
}