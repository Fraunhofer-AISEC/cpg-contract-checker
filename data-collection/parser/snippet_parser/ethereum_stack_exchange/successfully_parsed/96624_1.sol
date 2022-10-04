
pragma solidity ^0.7.1;

import "./A.sol";

contract B {
  uint public someValue;

  function setVal(A _a) public { someValue = _a.value(); }
  function getVal() public view returns (uint) { return someValue; }

}
