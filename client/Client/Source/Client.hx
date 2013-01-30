package;

import flash.display.Sprite;
import flash.Lib;


class Client extends Sprite {
	
	public function new () {
		
		super ();
		
		
		
	}
	
	static function main () {
		
		Lib.current.addChild (new Client ());
		
	}

}
