package;

import flash.display.Sprite;
import flash.Lib;

import flash.events.Event;

import server.Server;

class Client extends Sprite {
	
	private var server:Server;
	static function main () {
		Lib.current.addChild (new Client ());	
	}
	public function new () {
		trace("start");
		super ();
		this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		
	}
	private function onAdded(e:Event):Void {
		init();
	}
	private function init():Void {
		initServer();
	}
	private function initServer():Void {
		server = new Server("127.0.0.1", 8080);
	}

}