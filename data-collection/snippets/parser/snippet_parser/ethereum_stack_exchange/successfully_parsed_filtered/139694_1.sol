contract HelloWorld {
  uint storedValue;

  function set(uint x) public {
    storedValue = x;
  }

  function get() public view returns (uint) {
    return storedValue;
  }
}

