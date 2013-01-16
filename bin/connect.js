
exports.connect = function(server, port) {
    exports.server = require(server).createServer(onCreateServer);
    exports.server.listen(port);
}

var fs = require('fs');
function onCreateServer (req, res) {
    fs.readFile(__dirname + '/index.html', onReadFile);
    
    function onReadFile(err, data) {
        if (err) {
          res.writeHead(500);
          return res.end('Error loading index.html');
        }
        res.writeHead(200);
        res.end(data);
        return null;
    }
}

