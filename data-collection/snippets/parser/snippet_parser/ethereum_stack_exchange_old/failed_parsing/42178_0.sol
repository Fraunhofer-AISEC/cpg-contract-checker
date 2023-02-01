    function 64bytesToSHA3_512(bytes _message) returns (bytes) {

        uint64[8] memory input;

        for(uint i = 0; i < 8; i++) {
            bytes8 oneEigth;
            
            assembly {
                oneEigth := mload(add(_message, add(32, mul(i, 8)))) 
            }
            input[i] = uint64(oneEigth);
        }

        uint32[16] memory output = hash(input); 

        bytes memory messageHash = new bytes(64);

        for(i = 0; i < 16; i++) {
            bytes4 oneSixteenth = bytes4(output[i]);
            
            assembly { mstore(add(messageHash, add(32, mul(i, 4))), oneSixteenth) }
        }

        return messageHash;
    }
