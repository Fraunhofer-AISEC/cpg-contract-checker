contract TestContract {
  uint256 private value;

  constructor (uint256 _value) {
    value = _value;
  }

  function getValue() public view returns (uint256) {
    return value;
  }
}
