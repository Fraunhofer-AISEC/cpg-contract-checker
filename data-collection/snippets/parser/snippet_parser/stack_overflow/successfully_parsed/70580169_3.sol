function stringToBytes32(string memory hexString) public pure returns (bytes32 stringInBytes32) {
    assembly {
        stringInBytes32:= mload(add(hexString, 32))
    }
}
