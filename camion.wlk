import cosas.*

object camion {
	const cosas = #{}
	const tara = 1000
	var peligrosidadMinimaParaRuta = 20
	method cargar(unaCosa) {
		if (not (cosas.contains(unaCosa))) {
			cosas.add(unaCosa)
		}
		else {
			self.error("La cosa ya está cargada")
		}
	}
	method cosas(){
		return cosas
	}
	method descargar(otraCosa) {
		if (cosas.contains(otraCosa)) {
			cosas.remove(otraCosa)
		}
		else {
			self.error("La cosa no está cargada")
		}
	}
	method pesoEnCamion() {
		return cosas.sum({cosa => cosa.peso()}) 
	}
	method pesoPar(){
		return self.pesoEnCamion() % 2 == 0
	}
	method hayDePesoIgualA(peso) {
		return cosas.any({cosa => cosa.peso() == peso})
	}
	method pesoTotalEnCamion() {
		return tara + self.pesoEnCamion()
	}
	method estaExcedido() {
		return self.pesoTotalEnCamion() > 2500
	}
	method hayPeligrosidadDe(nivel) {
		return cosas.any({cosa => cosa.nivelPeligrosidad() == nivel})
	}
	method hayPeligrosidadMayorA(otra) {
		return self.hayPeligrosidadDe(otra.nivelPeligrosidad())
	}
	method puedeCircularEnRuta(nivel) {
		return not self.estaExcedido() and not self.hayPeligrosidadDe(nivel)
	}
	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}
	method pesosDentroDeCamion() {
		return cosas.map({cosa => cosa.peso()})
	}
	method totalDeBultos(){
		return cosas.size()
	}
	method accidente(){
		cosas.forEach({cosa => cosa.accidente()})
	}
	method dejarCosasEn(destino) {
		destino.almacenar(cosas)
		cosas.clear()
	}
	method peligrosidadMinimaParaRuta(_peligrosidadMinimaParaRuta) {
		peligrosidadMinimaParaRuta = _peligrosidadMinimaParaRuta
	}
	method transportar(destino, camino){
		if (camino.permiteViajar(self)) {
			self.dejarCosasEn(destino)
		}
		else {
			self.error("No se puede circular por ese camino")
		}
	}

}

object almacen {
	const almacenado = #{}
	method almacenar(contenedor){
		almacenado.addAll(contenedor)
	}
	method almacenado() {
		return almacenado
	}
	method almacen(cosa){
		almacenado.add(cosa)
	}
}

object ruta {
	var peligrosidadMinimaParaRuta = 20
	method permiteViajar(camion) {
		return camion.puedeCircularEnRuta(peligrosidadMinimaParaRuta) 
	}
	method peligrosidadMinimaParaRuta(_peligrosidadMinimaParaRuta) {
		peligrosidadMinimaParaRuta = _peligrosidadMinimaParaRuta
	}
}

object caminosVecinales {
	var pesoLimiteDeCaminosVecinales = 2000
	method permiteViajar(camion) {
		return camion.pesoTotalEnCamion() < pesoLimiteDeCaminosVecinales
	}
	method pesoLimiteDeCaminosVecinales(_pesoLimiteDeCaminosVecinales) {
		pesoLimiteDeCaminosVecinales = _pesoLimiteDeCaminosVecinales
	}
}