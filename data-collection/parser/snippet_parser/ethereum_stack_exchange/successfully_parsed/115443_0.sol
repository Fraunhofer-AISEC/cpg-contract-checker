pragma solidity ^0.6.0;

contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    isSold = true;
  }
}
