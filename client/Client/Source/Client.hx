package;

import flash.display.Sprite;
import flash.Lib;

import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ErrorEvent;
import flash.events.ProgressEvent;

import flash.net.Socket;

import flash.external.ExternalInterface;

class Client extends Sprite {
	
	
	private var socket:Socket;
	public function new () {
		console("alert()");
		super ();
		this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		
	}
	static function main () {
		
		Lib.current.addChild (new Client ());	
	}
	
	private function onAdded(e:Event):Void {
		init();
	}
	private function init():Void {
		initSocket();
		
		connectSocket("localhost", 8080);
	}
	private function initSocket():Void {
		socket = new Socket();
		socket.addEventListener(Event.CONNECT, onConnection); 
	    socket.addEventListener(Event.CLOSE, onClose); 
	    socket.addEventListener(ErrorEvent.ERROR, onError); 
	    socket.addEventListener(IOErrorEvent.IO_ERROR, onIOError); 
	    socket.addEventListener(ProgressEvent.SOCKET_DATA, onData); 
	    
	    
	}
	private function connectSocket(host:String, port:Int):Void {
		socket.connect(host, port);
	}
	private function onConnection(e:Event):Void {
		console("connected");
	}
	private function onClose(e:Event):Void {
		console("closed");
	}
	private function onError(e:ErrorEvent):Void {
		trace(e.errorID + " " + e.text);
	}
	private function onIOError(e:IOErrorEvent):Void {
	
	}
	private function onData(e:ProgressEvent):Void {
	
	}
	
	private function console(e:String):Void {
		ExternalInterface.call("function(){" + e + "}");
	}

}
