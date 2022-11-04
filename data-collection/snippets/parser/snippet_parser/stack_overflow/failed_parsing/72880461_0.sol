function bytesToAddress(bytes memory byte) public pure returns (address addr) {

        assembly {
             addr := mload(add(byte, 20))
       }
    }
