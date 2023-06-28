function equality() public pure returns (bool) {
 bytes memory test = "0x01020304";

 
 return keccak256(test) == keccak256(abi.encodePacked(test));
}
