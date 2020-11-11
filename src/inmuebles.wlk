import inmobiliaria.*

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
	var estaReservada = false
	var clienteQueLaReservo = null
	
	method estaReservada() = estaReservada
	
	method reservarse(unCliente){
		clienteQueLaReservo = unCliente
		estaReservada = true
	}
	
	method noEstaReservadoPor(unCliente) = unCliente != clienteQueLaReservo
	
	method operacionPublicacion() = operacionPublicacion
	
	method puedeSerVendido() = true
}

class PH inherits Inmueble{
	// Los PH tienen un valor de 14.000 por metro cuadrado, con un mínimo de 500.000. 
	method valor() = (14000 * tamanio).max(500000)
}

class Depto inherits Inmueble{
	// Los departamentos se tasan a 350.000 por ambiente
	method valor() = 350000 * cantidadAmbientes 	
}

class Casa inherits Inmueble{
	var valor
	
	// Si es una casa, tiene un valor particular para esa casa.
	method valor() = valor	
}

class Local inherits Casa{
	// galpon o aLaCalle
	var tipoLocal 
	
	override method valor() = tipoLocal.calcularValorLocal(valor)
	
	override method puedeSerVendido() = false
	// Me hubiera gustado poner esto 
	// self.error("Los LOCALES NO pueden ser VENDIDOS")
	// pero no me parecia dejar el metodo puedeSerVendido()	vacio
	// en la super clase 
		
}

object galpon{
	method calcularValorLocal(unValor) = unValor / 2
}

object aLaCalle{
	method calcularValorLocal(unValor) = unValor + inmobiliaria.valorFijoAlaCalle()
}
