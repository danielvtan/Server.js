// file system
var fs = require("fs");
function loadFile(url, type) {
    return fs.readFileSync(url);
}


exports.loadFile = loadFile;