

// load utils
var UTILS = require("./utils");
// load configuration
var CONFIG = require("./config").CONFIG;

var http = require("http");
var httpServer = http.createServer(onRespond);
httpServer.listen(80, "127.0.0.1");

function onRespond(request, response) {
        request.on("end", function(){
                onRequestEnd(request, response);
            });
}
function onRequestEnd(request, response) {
    response.writeHead(200, { "Content-Type": "text/html" });
    
    var url = request.url;
    if(CONFIG.urls[url] != undefined) {
        response.end(UTILS.loadFile(CONFIG.www + CONFIG.urls[url]));
        return;
    }
    response.end(UTILS.loadFile(CONFIG.www + request.url));
}   
console.log("Http server running at http://127.0.0.1:80/");


// load socket server
var socketServer = require("./socket-server");

socketServer.start(8080, "127.0.0.1");




