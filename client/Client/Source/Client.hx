package;

import flash.display.Sprite;
import flash.Lib;

import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ErrorEvent;
import flash.events.ProgressEvent;

import flash.net.Socket;
import flash.net.XMLSocket;

import flash.external.ExternalInterface;

class Client extends Sprite {
	
	
	private var socket:Socket;
	public function new () {
		console("start");
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
		
		connectSocket("127.0.0.1", 8080);
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
		
		//socket.writeUTF("test");
		socket.writeUTFBytes("test");
		socket.flush();
	}
	private function onClose(e:Event):Void {
		console("closed");
		socket.close();
	}
	private function onError(e:ErrorEvent):Void {
		console(e.errorID + " " + e.text);
	}
	private function onIOError(e:IOErrorEvent):Void {
		console("onIOError");
	}
	private function onData(e:ProgressEvent):Void {
		console("onData");
		console("reading readUTFBytes-> " + socket.readUTFBytes(socket.bytesAvailable));
	}
	
	private function console(e:String):Void {
		try {
			//if(ExternalInterface.available)
			//	ExternalInterface.call("function(){" + e + "}");
			//else
				trace(e);
		} catch(e:Dynamic) {
			trace("Error " + e);
		}
		
	}

}
