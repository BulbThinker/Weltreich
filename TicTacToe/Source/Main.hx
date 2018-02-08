package;

import openfl.display.Sprite;
import weltreich.tictactoe.genetic.ChromosomeTTT;
import weltreich.tictactoe.ia.SpielerTTT;

class Main extends Sprite {
	
	public function new () {
		super ();
		testZone();
	}
	
	public function testZone() {
		var chromosome = new ChromosomeTTT();
		var spieler = new SpielerTTT(chromosome);
		trace(spieler.think([0,0,0,0,0,0,0,0,0]));
	}

}