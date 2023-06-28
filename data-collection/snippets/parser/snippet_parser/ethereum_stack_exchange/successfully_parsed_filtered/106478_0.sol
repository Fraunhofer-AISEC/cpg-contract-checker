function testEncode() public pure returns(bytes memory) {
  return abi.encodePacked(uint(2), uint(0)); 
  
}

function testA() public pure returns(bytes32) {
  return keccak256(abi.encodePacked(uint(2), uint(0)));
  
}

function testB() public pure returns(bytes32) {
  
  return keccak256("0x00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000"); 
  
}
