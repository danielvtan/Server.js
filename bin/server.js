
var server = require("./connect");
server.connect("http", 8080);

var io = require('socket.io').listen(server.server);

io.sockets.on('connection', function (socket) {
    socket.emit('connection', { success: true });
});

