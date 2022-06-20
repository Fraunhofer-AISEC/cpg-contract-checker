contract Demo {
  uint256 private _counter = 1;

  function counter() public view returns (uint256) {
    return _counter - 1;
  }

  function increment() public {
    _counter++;
  }
}
