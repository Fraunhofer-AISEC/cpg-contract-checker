pragma solidity ^0.4.18;

library SLib {
  struct SCtx {
    uint a;
  }

  function init(SCtx storage self, uint _a) public
  {
    self.a = _a;
  }

  function getA(SCtx storage self) public view returns (uint)
  {
    return self.a;
  }
}
