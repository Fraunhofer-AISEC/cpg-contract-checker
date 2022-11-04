    function StringToBytes(string memory _str) public pure returns (bytes memory) {
        return bytes(_str);
        
    }
    function StringToBytesLength(string memory _str) public pure returns (uint256) {
        return bytes(_str).length;
        
    }
