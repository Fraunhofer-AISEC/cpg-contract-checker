pragma solidity ^0.4.19;

contract LoopExample {
  function constantLoop(uint256 iterations) public constant {
    uint256 someVal;
    
    for (uint256 i = 0; i < iterations; i++) {
      someVal = uint256(keccak256(now, i));
    }
  }
}
