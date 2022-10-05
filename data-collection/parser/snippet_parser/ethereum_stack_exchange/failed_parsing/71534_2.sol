input :  ["0x00","0xaa", "0xff"]

function foo(bytes memory input) public view returns (bytes memory) {
    return input;
}

output:  0: bytes: 0x00aaff
