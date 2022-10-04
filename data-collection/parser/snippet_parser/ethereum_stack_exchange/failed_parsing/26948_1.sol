var utf8 = require('utf8');

function padToBytes32(n) {
    while (n.length < 64) {
        n = n + "0";
    }
    return "0x" + n;
}

function fromUtf8(str) {
    str = utf8.encode(str);
    var hex = "";
    for (var i = 0; i < str.length; i++) {
        var code = str.charCodeAt(i);
        if (code === 0) {
            break;
        }
        var n = code.toString(16);
        hex += n.length < 2 ? '0' + n : n;
    }

    return padToBytes32(hex);
};


function toUtf8(hex) {
    
    var str = "";
    var i = 0, l = hex.length;
    if (hex.substring(0, 2) === '0x') {
        i = 2;
    }
    for (; i < l; i += 2) {
        var code = parseInt(hex.substr(i, 2), 16);
        if (code === 0) {
            break;
        }
        str += String.fromCharCode(code);
    }

    return utf8.decode(str);
};

module.exports = {
    fromUtf8,
    toUtf8
};
