import inmobiliaria.*
import inmuebles.*

class Operacion{
	var inmueble
	
}

class Alquiler inherits Operacion {
	
	// Para los alquileres
	
	// se conoce la cantidad de meses por la que se pacta el contrato de alquiler
	var cantidadMeses
	
	// la comisión que le corresponde al agente 
	// es igual a la cantidad de meses por el valor del inmueble, dividido 50000.
	method comision() = (cantidadMeses * inmueble.valor()) / 50000
}

class Venta inherits Operacion{
	// Para una venta
	
	// se tiene un porcentaje sobre el valor del inmueble, 
	// siempre igual para todos los agentes de la inmobiliaria
	
	method comision() = inmobiliaria.porcentajeVenta() * inmueble.valor()
}

