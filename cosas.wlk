object knightRider {
	method peso() { 
		return 500 
	}
	method nivelPeligrosidad() { 
		return 10 
	}
	method accidente() {
	}
}

object arenaAGranel {
	var pesoTotal = 0
	method peso() { 
		return pesoTotal
}
	method nivelPeligrosidad() { 
		return 1 
	}
	method pesoTotal(_pesoTotal) {
		pesoTotal = _pesoTotal
	}
	method accidente() {
		pesoTotal = pesoTotal + 20
	}
}

object bumblebee {
	var estaTransformado = false
	method peso() { 
		return 800 
	}
	method nivelPeligrosidad() { 
		return if (self.estaTransformado()) {
			15
		}
		else {
			30
		}
	}
	method estaTransformado() {
		return estaTransformado
	}
	method estaTransformado(_estaTransformado) {
		estaTransformado = _estaTransformado
	}
	method accidente() {
		estaTransformado = not (estaTransformado)
	}
}

object paqueteDeLadrillos {
	var cantidadDeLadrillos = 10
	const pesoDeCadaLadrillo = 2

	method peso() { 
		return self.cantidadDeLadrillos() * self.pesoDeCadaLadrillo()
	}
	method nivelPeligrosidad() { 
		return 2 
		}
	method cantidadDeLadrillos() {
		return cantidadDeLadrillos
	}
	method cantidadDeLadrillos(_cantidadDeLadrillos) {
		cantidadDeLadrillos = _cantidadDeLadrillos
	}
	method pesoDeCadaLadrillo() {
		return pesoDeCadaLadrillo
	}
	method accidente() {
		return if (cantidadDeLadrillos >= 12) {
			cantidadDeLadrillos = cantidadDeLadrillos - 12
		}
		else {
			cantidadDeLadrillos = 0
		}
	}
}	
object bateriaAntiaerea {
	var pesoDeBateria = 300
	var estaCargada = true

	method peso() { 
		return if (self.estaCargada()) {
			self.pesoDeBateria()
		}
		else {
			self.pesoDeBateria() - 100 
		}
	}
	method nivelPeligrosidad() { 
		return if (self.estaCargada()) {
			100
		}
		else {
			0
		}
	}
	method estaCargada() {
		return estaCargada
	}
	method estaCargada(_estaCargada) {
		estaCargada = _estaCargada
	}
	method pesoDeBateria() {
		return pesoDeBateria
	}
	method pesoDeBateria(_pesoDeBateria) {
		pesoDeBateria = _pesoDeBateria
	}
	method accidente() {
		estaCargada = false
	}
  
}


object residuosRadioactivos {
	
	var pesoResiduos = 100

	method peso() { 
		return self.pesoResiduos()
	}
	method nivelPeligrosidad() { 
		return 200 
	}

	method pesoResiduos(_pesoResiduos) {
		pesoResiduos = _pesoResiduos
	}
	method pesoResiduos() {
		return pesoResiduos
	} 
	method accidente() {
		pesoResiduos = pesoResiduos + 15
	}
}

object contenedorPortuario {
	const pesoContenedor = 100
	const cosasEnContenedor = #{}
	method peso() {
		return pesoContenedor + cosasEnContenedor.sum({cosa => cosa.peso()})
	}
	method nivelPeligrosidad() {
		return cosasEnContenedor.max({cosa => cosa.nivelPeligrosidad()})
	}
	method accidente() {
		cosasEnContenedor.forEach({cosa => cosa.accidente()})
	}
	method agregarCosa(cosa) {
		cosasEnContenedor.add(cosa)
	}
}

object embalajeDeSeguridad{
	var objetoEnEmbalaje = knightRider
	method peso() {
		return objetoEnEmbalaje.peso()
	}
	method nivelPeligrosidad() {
		return objetoEnEmbalaje.nivelPeligrosidad() / 2
	}
	method accidente() {
	}
	method objetoEnEmbalaje(_objetoEnEmbalaje) {
		objetoEnEmbalaje = _objetoEnEmbalaje
	}
}

