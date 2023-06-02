import rodados.*

class Dependencia {
	const flota = []
	var property empleados
	const pedidos = []
	
	method agregarAFlota(unRodado) {
		flota.add(unRodado)
	}
	method quitarDeFlota(unRodado) {
		flota.remove(unRodado)
	}
	method pesoTotalFlota() = flota.sum({r=>r.peso()})
	
	method estaBienEquipada() { return
	 flota.size() >= 3 && flota.all({r=>r.velocidad() >= 100})
	}
	
	method capacidadTotalEnColor(color) { return
		flota.filter({r=>r.color()==color}).sum({r=>r.capacidad()})
	}
	
	method colorDelRodadoMasRapido() { return
		flota.max({r=>r.velocidad()}).color()
	}
	
	method capacidadFlota() = flota.sum({r=>r.capacidad()})
	
	method capacidadFaltante() { return
		0.max(empleados - self.capacidadFlota())
	}
	
	method esGrande() { return
		empleados >= 40 && flota.size() >= 5
	}
	
	method agregarPedido(unPedido) {
		pedidos.add(unPedido)
	}

	method quitarPedido(unPedido) {
		pedidos.remove(unPedido)
	}
	
	method totalPasajerosEnPedidos() {
		return pedidos.sum({p=>p.cantPasajeros()})
	}
	
	method hayAlgunRodadoQueSatisfaceUnPedido(unPedido) { return
		flota.any({r=>unPedido.puedeSatisfacer(r)})
	}
	
	method pedidosNoPuedeSatisfacer() { return
		pedidos.filter({p=>!self.hayAlgunRodadoQueSatisfaceUnPedido(p)})
	}
	
	method todosPedidosTienenColorIncompatible(unColor) {
		return pedidos.all({p=>p.colorIncompatible(unColor)})
	}
}
