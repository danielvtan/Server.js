package server;

import flash.events.EventDispatcher;

import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ErrorEvent;
import flash.events.ProgressEvent;

import flash.net.Socket;


class SocketServer extends EventDispatcher {
	
	private var socket:Socket;
	
	private var host:String;
	private var port:Int;
	
	public function new (h:String, p:Int) {
		super();
		
		host = h;
		port = p;
		initSocket();
	}
	private function initSocket():Void {
		socket = new Socket(host, port);
		socket.addEventListener(Event.CONNECT, onConnection); 
	    socket.addEventListener(Event.CLOSE, onClose); 
	    socket.addEventListener(ErrorEvent.ERROR, onError); 
	    socket.addEventListener(IOErrorEvent.IO_ERROR, onIOError); 
	    socket.addEventListener(ProgressEvent.SOCKET_DATA, onData); 
	    
	}
	private function onConnection(e:Event):Void {
		trace("connected");
		
		//socket.writeUTF("test");
		socket.writeUTFBytes("test");
		socket.flush();
	}
	private function onClose(e:Event):Void {
		trace("closed");
		socket.close();
	}
	private function onError(e:ErrorEvent):Void {
		trace(e.errorID + " " + e.text);
	}
	private function onIOError(e:IOErrorEvent):Void {
		trace("onIOError");
	}
	private function onData(e:ProgressEvent):Void {
		trace("onData");
		trace("reading readUTFBytes-> " + socket.readUTFBytes(socket.bytesAvailable));
	}

}
