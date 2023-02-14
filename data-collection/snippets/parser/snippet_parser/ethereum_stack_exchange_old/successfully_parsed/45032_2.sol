pragma solidity ^0.4.18;

import "./TLib.sol";

contract TInterface {
  using TLib for TLib.TCtx;
  TLib.TCtx t;

  function TInterface(uint _a) public {
    t.init(_a);
  }

  function getA() public view returns (uint) {
    return t.getA();
  }
}
