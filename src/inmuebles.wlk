
class Inmueble {
	
	// De todos los inmuebles se conoce:
	
	//el tamaño , en metros cuadrados
	var tamanio
	
	// la cantidad de ambientes
	var cantidadAmbientes
	
	// la operación para la que se la publica (venta o alquiler).
	var operacionPublicacion
	
	// la zona en donde está el inmueble
	var zona
	
	// el valor de cada inmueble , depende de diversos factores
	// estara definido en cada subclase de Inmueble
	
	// Un cliente puede solicitar a un empleado realizar una reserva sobre una propiedad
	var estaReservada
	var clienteQueLaReservo
	var empleadoQueLaReservo
}

class Casa inherits Inmueble{
	var valor
	
	// Si es una casa, tiene un valor particular para esa casa.
	method valor() = valor	
}

class PH inherits Inmueble{
	// Los PH tienen un valor de 14.000 por metro cuadrado, con un mínimo de 500.000. 
	method valor() = (14000 * tamanio).max(500000)
}

class Depto inherits Inmueble{
	// Los departamentos se tasan a 350.000 por ambiente
	method valor() = 350000 * cantidadAmbientes
 	
}


