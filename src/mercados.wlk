import wollok.game.*
import hector.*
import cosechas.*

class Mercado {
	var property position
	var property image = "market.png"
	var property dinero
	var property mercaderia = []
	
	method regate(){game.say(self, "No me puedes regar a mi")}
	
	method esCosechable() = false
	
	method esMercado() = true
	
	method vendio(){
		dinero -= hector.total()
		mercaderia.addAll(hector.paraVender())
	}
	
	method reporte(){
		game.say(self,"Tengo "+dinero+"monedas, y esta mercaderia: "+mercaderia)
	}
}
