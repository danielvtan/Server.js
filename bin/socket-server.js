
var net = require("net");
var socketServer = net.createServer(onClientRequest);


function socketServerStart(port, host) {
    socketServer.listen(port, host)
    console.log("Socket server running at http://127.0.0.1:8080/");
}

function onClientRequest(socket) {
	socket.on("connect", function() {
                onClientConnect(socket);
            });
	socket.on("data", function(data) {
                onClientData(socket, data);
            });
        socket.on("end", function() {
                onClientEnd(socket);
            });
}

function onClientConnect(socket) {
    socket.write("connected", "utf8");
}
function onClientData(socket, data) {
        console.log(data);
	if(data == "exit") {
		console.log("exit");
		socket.end();
	} else {
		console.log("Socket Data " + data);
		socket.write(data);
	}
        
}
function onClientEnd(socket) {
    console.log("client end");
}



exports.start = socketServerStart;