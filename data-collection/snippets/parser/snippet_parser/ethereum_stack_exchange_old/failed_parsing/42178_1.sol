    uint64[8] memory input;

    

    bytes memory reversed = new bytes(64);

    for(uint i = 0; i < 64; i++) {
        reversed[i] = _message[63 - i];
    }
