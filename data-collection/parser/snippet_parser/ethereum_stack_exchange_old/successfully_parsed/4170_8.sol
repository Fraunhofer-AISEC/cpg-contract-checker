function scriptNumSize(uint256 i) public view returns (uint256) {
    if      (i > 0x7fffffff) { return 5; }
    else if (i > 0x7fffff  ) { return 4; }
    else if (i > 0x7fff    ) { return 3; }
    else if (i > 0x7f      ) { return 2; }
    else if (i > 0x00      ) { return 1; }
    else                     { return 0; }
}

function toBytes(uint256 x) public view returns (bytes memory b) {
    uint a = scriptNumSize(x);
    b = new bytes(a);
    for (uint i = 0; i < a; i++) {
        b[i] = byte(uint8(x / (2**(8*(a - 1 - i))))); 
    }
}
