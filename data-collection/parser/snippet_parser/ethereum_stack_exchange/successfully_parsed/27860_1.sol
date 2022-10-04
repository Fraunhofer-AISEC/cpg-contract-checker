pragma solidity ^0.4.11;

contract Delegate {

  uint public total;

  function Delegate() {
    
  }

  function add(uint256 var1, uint256 var2) {
    total = var1 + var2;
  }
}
