import wollok.game.*
import cosechas.*

object hector {

	var property position = game.at(3, 3)

	method image() = "player.png"
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
	
	method sembra(comida){
		comida.position(self.position())
		game.addVisual(comida)	
	}
	
	method deja(comida) {
		//comida.cantDeGranos()
		comida.position(self.position())
		game.addVisual(comida)		
	}
	
	method sembraMaiz() {
		self.deja(new Maiz())		
	}
	method sembraTrigo() {
		self.deja(new Trigo())		
	}
	method sembraTomaco() {
		self.deja(new Tomaco())		
	}
	
	method rega(){
		if (self.tengoAlgoParaRegar())
			{self.regaYa()}
		else
			//{self.error("No tengo nada para regar!!!")}
			{game.say(self, "No tengo nada para regar!!!")}
	}
	
	method tengoAlgoParaRegar() = not game.colliders(self).isEmpty()
		
	method regaYa(){
		game.colliders(self).first().regate()
	}

	/*method come(comida) {
		energia = energia + comida.energia()
		self.seMurio()
		game.removeVisual(comida)
	}

	method seMurio() {
		if (self.estaMuerta()) gameOver.terminarJuego()
	}

	method volaYCome(comida) {
		self.move(comida.position())
		self.llegoAComidaEnTablero(comida)
	}

	method llegoAComidaEnTablero(comida) {
		if (self.mismaPosicion(comida.position())) {
			self.come(comida)
			game.removeVisual(comida)
			comida.aparecerEnTablero()
		}
	}

	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.position())
			if (self.mismaPosicion(unaCiudad.position())) ciudad = unaCiudad
		} else game.say(self, "Ya estoy " + unaCiudad + "!!!!")
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method tieneEnergiaParaVolar(nuevaPosicion) = energia >= self.energiaParaVolar(position.distance(nuevaPosicion))

	method move(nuevaPosicion) {
		if (not self.mismaPosicion(nuevaPosicion)) {
			if (self.tieneEnergiaParaVolar(nuevaPosicion)) {
				energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
				self.position(nuevaPosicion)
				ciudad = afueras
			} else game.say(self, "Dame de comer Primero")
		}
	}
	
	method saludar(){
		game.say(self, "Hola ROCKY!")
	}
*/
}