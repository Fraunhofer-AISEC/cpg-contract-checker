contract SafeMath {
  function add(uint256 _a, uint256 _b) external pure returns (uint256) {
      uint256 c = _a + _b;
      require(c >= _a, "ERROR_ADD_OVERFLOW");
      return c;
  }
}

contract UsingExternalContract {
  SafeMath private constant math = 0x123abc...;
 
  uint256 x = 0;

  function doSomething() public {
    x = math.add(x, 1);
  }
}
