 pragma solidity ^0.4.0;

contract Test {
  address public thisAddress;
  event LogAddr(address);

  function Test()  {
    thisAddress = address(this);
    LogAddr(address(this));
  }
}
