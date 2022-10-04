    bytes memory reverseHash = new bytes(64);

    for(i = 0; i < 16; i++) {
        bytes4 oneSixteenth = bytes4(output[15 - i]);
        
        assembly { mstore(add(reverseHash, add(32, mul(i, 4))), oneSixteenth) }
    }

    bytes memory messageHash = new bytes(64);

    for(uint i = 0; i < 64; i++) {
        messageHash[i] = reverseHash[63 - i];
    }
