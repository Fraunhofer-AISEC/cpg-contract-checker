function SimpleHash(bytes32 val) public returns (bytes32) {
   bytes32 h = sha256(abi.encodePacked(val));
   return h;
}
