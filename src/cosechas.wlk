import wollok.game.*
import hector.*

class Maiz {

	var property position = game.at(20, 20)
	var property image = "corn_baby.png"

	//method image() = "corn_baby.png"
	
	method regate(){
		self.image("corn_adult.png")
	}
	
	method esCosechable() = image == "corn_adult.png"
	
	method precio() = 150

	/*method energia() = 80

	method aparecerEnTablero() {
		self.position(game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0)))
		game.addVisual(self)
		game.whenCollideDo(self, { elemento =>
			if (elemento == roque) roque.levantar(self)
		})
		
	}*/
	/*game.whenCollideDo(self, { cosa =>
			if (cosa == pepita) pepita.come(self)
		})*/
	/*method apareceDondeRoque() {
		game.removeVisual(self)
	}
	method teChoco(persona){
		persona.come(self)
	}*/

}


class Trigo {

	var property position
	
	var property image = "wheat_0.png"
	
	var etapa = 0

	//method image() = "wheat_0.png"
	
	method regate(){
		self.cambiarEtapa()
		self.image("wheat_"+etapa+".png")
	}

	method cambiarEtapa(){
		etapa++
		if(etapa == 4)
			{etapa = 0}
	}
	
	method esCosechable() = etapa>=2
	
	method precio() = (etapa - 1) * 100
	/*method energia() = 0.5 * granos

	method aparecerEnTablero() {
		self.position(game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0)))
		game.addVisual(self)
		game.whenCollideDo(self, { elemento =>
			if (elemento == roque) roque.levantar(self)
		})
	}
	method teChoco(persona){
		persona.come(self)
	}*/

}

class Tomaco {

	var property position

	method image() = "tomaco.png"
	
	method regate() {
		if(position.y() == 9){
			position = game.at(position.x(),0)
			self.choque()
		}
		else{
			self.position(self.position().up(1))
			self.choque()
		}
	}
	
	method choque(){
		if(not game.colliders(self).isEmpty()){
			self.regate()
		}
	}	
	
	method esCosechable() = true
	
	method precio() = 80

	/*method energia() = 0.5 * granos

	method aparecerEnTablero() {
		self.position(game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0)))
		game.addVisual(self)
		game.whenCollideDo(self, { elemento =>
			if (elemento == roque) roque.levantar(self)
		})
	}
	method teChoco(persona){
		persona.come(self)
	}*/

}



//object sinComida {}

/*object veneno{var property position = game.at(8, 8)

	method image() = "veneno.png"

	method energia() = -100000

	method aparecerEnTablero() {
		self.position(game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0)))
		game.addVisual(self)
		game.whenCollideDo(self, { elemento =>
			if (elemento == roque) roque.levantar(self)
		})
	}
	
}*/