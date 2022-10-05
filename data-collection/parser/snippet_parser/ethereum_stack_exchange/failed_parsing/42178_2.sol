    for(i = 0; i < 8; i++) {
        bytes8 oneEigth;
        
        assembly {
            oneEigth := mload(add(reversed, add(32, mul(i, 8)))) 
        }
        input[7 - i] = uint64(oneEigth);
    }

    uint32[16] memory output = hash(input); 
