function set(string memory x) public {
   storedData = x;
  }

  function get() public view returns (string memory) {
    return storedData;
  }
}
