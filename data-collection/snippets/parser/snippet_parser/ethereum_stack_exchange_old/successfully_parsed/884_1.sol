function toBytes(address a) public pure returns (bytes memory) {
    return abi.encodePacked(a);
}
