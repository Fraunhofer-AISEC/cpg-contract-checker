function chance(string memory str) public view returns (string memory) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(4);
        for(uint i = 8; i < strBytes.length; i++) {
            result[i-8] = strBytes[i];
        }
        return string(result);
    }
