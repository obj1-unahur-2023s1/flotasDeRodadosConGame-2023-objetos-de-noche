import rodados.*
import dependencias.*

class Pedido {
	const property distancia
	var property tiempoMaximo
	const property cantPasajeros
	const property coloresIncompatibles = #{}
	
	method velocidadRequerida() {
		return distancia / tiempoMaximo
	}
	method agregarColorIncomp(unColor) {coloresIncompatibles.add(unColor)}
	method puedeSatisfacer(unRodado) {
		return (unRodado.velocidad() >= 
			self.velocidadRequerida() + 10) && 
			unRodado.capacidad() >= cantPasajeros &&
			not self.colorIncompatible(unRodado.color())
	}	
	
	method colorIncompatible(unColor) {
		return coloresIncompatibles.contains(unColor)
	}
	
}
