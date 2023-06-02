import wollok.game.*

class Corsa {
	var property color
	var position //= new Position(x = 4, y = 7) //game.at(4,7)
	var property image = color.image()
	const property regPosi = []
	method capacidad() = 4
	method velocidad() = 150
	method peso() = 1300
	
	
	//parte4
	method position() = position
	
	method position(posicion){
		regPosi.add(position)
		position = posicion
	}
	
	method pasoPor(posicion){
		return regPosi.contains(posicion)
	}
	
	method pasoPorFila(numero){
		return
		regPosi.any({p=>p.y() == numero})
	}
	
	method recorrioFilas(lista_de_numeros){
		return lista_de_numeros.all({n => self.pasoPorFila(n)})
	}
	
	method arriba(){ if (position.y()< game.height()-1)
		self.position(position.up(1))
	}
	
	method abajo(){ if (position.y()>0)
		self.position(position.down(1))
	}
	
	method izquierda(){ if (position.x()>0)
		self.position(position.left(1))
	}
	
	method derecha(){ if (position.x()< game.width()-1)
		self.position(position.right(1))
	}
	 method chocar(unaPared){
	 	unaPared.impacto() //cambia la imagen
	 	if (unaPared.resistencia() != 0 )
 			{unaPared.resistencia(0.max(unaPared.resistencia()-1))
 			self.position(regPosi.get(regPosi.size()-2))
 			}
 		}
 	method impacto(){}///pra q no de error
}

class Kwid {
	var property tieneAdicional = false
	method capacidad() = if(tieneAdicional) 3 else 4
	method velocidad() = if(tieneAdicional) 120 else 110
	method peso() = 1200 + if(tieneAdicional) 150 else 0
	method color() = "azul"
}

object trafic {
	var property interior
	var property motor
	
	method capacidad() = interior.capacidad()
	method velocidad() = motor.velocidad()
	method peso() = 4000 + interior.peso() + motor.peso()
	method color() = "blanco"
}

object comodo {
	method capacidad() = 5
	method peso() = 700
}

object popular {
	method capacidad() = 12
	method peso() = 1000
}

object pulenta {
	method velocidad() = 130
	method peso() = 800
}

object bataton {
	method velocidad() = 80
	method peso() = 500
}

class AutoEspecial {
	var property capacidad
	var property peso
	var property velocidad
	var property color
}

object rojo {
    method image() { return "autitoRojo2.png" } 
}
object azul { 
    method image() { return "autitoAzul.png" } }
object verde {
    method image() { return "autitoVerde.png" }  }
    
 class Pared{
 	var resistencia
 	//var property image =
	
 }

