pragma solidity ^0.8.0;

contract GasTest {

  event A(uint256);
  
  function testReturn() public returns (uint256) {
    return 5;
  }

  function testEmit() public  {
    emit A(5);
  }
}
