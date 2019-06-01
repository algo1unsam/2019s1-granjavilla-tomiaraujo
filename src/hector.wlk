import wollok.game.*
import cosechas.*
import mercados.*

object hector {

	var property position = game.at(3, 3)
	var property paraVender = []
	var property oro = 0
	var property cantidadDePlantas = 0

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
		if(not self.hayAlgo()){
			self.deja(new Maiz())
		}
		else{
			self.yaTengoCosechaAqui()
		}
	}
	method sembraTrigo() {
		if(not self.hayAlgo()){
			self.deja(new Trigo())	
		}
		else{
			self.yaTengoCosechaAqui()
		}	
	}
	method sembraTomaco() {
		if(not self.hayAlgo()){
			self.deja(new Tomaco())		
		}
		else{
			self.yaTengoCosechaAqui()
		}	
	}
	method yaTengoCosechaAqui(){game.say(self,"No puedo cosechar aqui")}
	
	method hayAlgo() = not game.colliders(self).isEmpty()
	
	method rega(){
		if (self.hayAlgo())
			{self.regaYa()}
		else
			//{self.error("No tengo nada para regar!!!")}
			{game.say(self, "No tengo nada para regar!!!")}
	}
			
	method regaYa(){
		game.colliders(self).first().regate()
	}
	
	method cosecha(){
		if(self.hayAlgo()){
			if(self.cosechaEnLaQueEstoyParada().esCosechable()){
				paraVender.add(self.cosechaEnLaQueEstoyParada())
				game.removeVisual(self.cosechaEnLaQueEstoyParada())
			}
			else{
				game.say(self, "No se puede")
			}
		}
		else{
			game.say(self, "No tengo nada para cosechar!!!")
		}
	}
	
	method cosechaEnLaQueEstoyParada() = game.colliders(self).first()
	
	method vende(){
		if(paraVender.isEmpty()){
			game.say(self, "No tengo nada para vender")
		}
		else{
			if(not self.hayAlgo() or not game.colliders(self).first().esMercado()){
				game.say(self, "No puedo vender aqui")
			}
			else{		
				oro = oro + self.total()
				game.colliders(self).first().vendio()				
				paraVender.clear()
				game.say(self, "Transaccion finalizada")			
			}
		}
	}
	
	method total() =
		paraVender.sum{planta => planta.precio()}
	
	method reporte(){
		game.say(self,"Tengo "+oro+"monedas, y "+self.contarPlantas()+" plantas para vender")
	}

	method contarPlantas() = paraVender.size()

}