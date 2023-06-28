pragma solidity ^0.4.18;

import "./SLib.sol";

library TLib {
  using SLib for SLib.SCtx;

  struct TCtx {
    SLib.SCtx s;
  }

  function init(TCtx storage self, uint _a) public
  {
    self.s.init(_a);
  }

  function getA(TCtx storage self) public view returns (uint) {
    return self.s.getA();
  }
}
