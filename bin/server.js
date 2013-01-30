
var net = require("net");
// create the server and register event listeners
var server = net.createServer(onClientRequest);
server.listen(8080, "127.0.0.1");


function onClientRequest(socket) {
        
	socket.on("connect", function() {
                onClientConnect(socket)
            });
	socket.on("data", function(data) {
                onClientData(socket, data)
            });
}

function onClientConnect(socket) {
    console.log("Connected " + socket);
    socket.write("Connected", 'utf8');
}
function onClientData(socket, data) {
	if(data == "exit\0") {
		console.log("exit");
		socket.end();
	} else {
		console.log("Socket Data " + data + " End");
		socket.write(data, 'utf8');
	}
        
}

/*
var http = require("http");
var server = http.createServer(onRespond);
server.listen(8000, "127.0.0.1");

function onRespond(request, response) {
  	
  	function onRequestEnd() {
  	
		response.writeHead(200, { "Content-Type": "text/plain" });
		// Send data and end response.
		response.end('Hello HTTP!');
  	}
  	// on request end listener
  	request.on("end", onRequestEnd);
}
console.log("Server running at http://127.0.0.1:8000/");
*/




