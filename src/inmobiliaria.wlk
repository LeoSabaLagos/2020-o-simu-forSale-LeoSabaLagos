
object inmobiliaria {
	
	// El sistema deberá llevar un registro de las operaciones que realizó la inmobiliaria
	// que pueden ser alquileres o ventas de un determinado inmueble
	var operacionesRealizadas = []
	
	// Para una venta para calcular la comision se tiene un porcentaje sobre 
	// el valor del inmueble , siempre igual para todos los agentes de la inmobiliaria
	var porcentajeVenta = 0.2 // Yo lo establezco al 10%
	
	method porcentajeVenta() = porcentajeVenta
	
	method realizarOperacion(unaOperacion){
		operacionesRealizadas.add(unaOperacion)
	}
}