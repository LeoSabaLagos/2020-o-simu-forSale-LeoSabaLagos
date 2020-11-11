
object inmobiliaria {
	
	// El sistema deberá llevar un registro de las operaciones que realizó la inmobiliaria
	// que pueden ser alquileres o ventas de un determinado inmueble
	var operacionesRealizadas = []
	
	// Para una venta para calcular la comision se tiene un porcentaje sobre 
	// el valor del inmueble , siempre igual para todos los agentes de la inmobiliaria
	var porcentajeVenta = 0.2 // Yo lo establezco al 10%
	
	var empleados = #{}
	
	var criterioMejorEmpleado
	
	var valorFijoAlaCalle
	
	method porcentajeVenta() = porcentajeVenta
	
	method realizarOperacion(unaOperacion){
		operacionesRealizadas.add(unaOperacion)
	}
	
	method mejorEmpleado() = criterioMejorEmpleado.averiguarlo()
	
	method empleados() = empleados
	
	method valorFijoAlaCalle() = valorFijoAlaCalle
}


// Punto 2

// Criterios para saber cual fue el mejor empleado

// 2a
object totalComisionesOperacionesCerradas {
	method averiguarlo(){
		inmobiliaria.empleados().max{empleado => empleado.totalComisionesOperacionesConcretadas()}
	}
}

// 2b
object cantidadOperacionesCerradas {
	method averiguarlo(){
		inmobiliaria.empleados().max{empleado => empleado.cantidadOperacionesCerradas()}
	}
}

// 2c
object cantidadReservas {
	method averiguarlo(){
		inmobiliaria.empleados().max{empleado => empleado.cantidadReservas()}	
	}
}

// Para agregar un nuevo criterio para averiguar el mejor empleado solo se necesita
// que entienda el mensaje averiguarlo() y que devuelva una instancia Empleado 