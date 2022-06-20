input : ["0xee", "0xff", "0xff", "0xff"]

function foo(bytes5 input) public view returns (bytes5) {
    return input;
}

output: 0: bytes5: 0xeeffffff00
