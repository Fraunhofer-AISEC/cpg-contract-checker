function decode(bytes memory _encoded) public pure returns (string memory x, string memory y) {
       return abi.decode(_encoded, (string, string));
    }  
