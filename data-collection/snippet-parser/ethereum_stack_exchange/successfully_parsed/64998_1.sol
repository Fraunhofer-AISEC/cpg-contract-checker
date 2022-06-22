function bytesToAddress(string memory _b) public returns (address) {
    bytes20 b = bytes20(bytes(_b));
    return address(uint160(b));
}
