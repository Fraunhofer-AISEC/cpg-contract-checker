library SafeMath {
  function add(uint256 _a, uint256 _b) external pure returns (uint256) {
      uint256 c = _a + _b;
      require(c >= _a, "ERROR_ADD_OVERFLOW");
      return c;
  }
}

contract UsingLibrary {
  using SafeMath for uint256;

  uint256 x = 0;

  function doSomething() public {
    x = x.add(1);
  }
}
