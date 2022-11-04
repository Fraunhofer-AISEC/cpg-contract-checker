pragma solidity ^0.8.0;

contract Example {

  function test() public view returns (bytes32, bytes32, bytes32) {
    
    
    

    
    bytes32 a = 0x0000000000000000000000000000000000000000000000000000000000000001;

    
    bytes32 b = 0x1000000000000000000000000000000000000000000000000000000000000000;

    
    bytes32 c = bytes32(uint256(1));

    return (a, b, c);
  }
}
