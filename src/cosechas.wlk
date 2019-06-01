import wollok.game.*
import hector.*
import mercados.*

class Maiz {

	var property position
	var property image = "corn_baby.png"

	//method image() = "corn_baby.png"
	
	method regate(){
		self.image("corn_adult.png")
	}
	
	method esCosechable() = image == "corn_adult.png"
	
	method precio() = 150
	
	method esMercado() = false

}


class Trigo {

	var property position
	
	var property image = "wheat_0.png"
	
	var etapa = 0
	
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
	
	method esMercado() = false
	
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
	
	method esMercado() = false

}